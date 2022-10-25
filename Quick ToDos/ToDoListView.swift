//
//  ToDoListView.swift
//  Quick ToDos
//
//  Created by Dovid Harrison on 10/24/22.
//

import SwiftUI

struct ToDoListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ToDo.title, ascending: true)],
        animation: .default)
    private var toDos: FetchedResults<ToDo>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(toDos) { listedToDo in
                        Text(listedToDo.title!)
                    }
                    .onDelete(perform: deleteToDos(offsets:))
                }
                
                .navigationTitle("Quick ToDos")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton().disabled(true)
                    }
                    //                        ToolbarItem {
                    //                            Button(action: {}) {
                    //                                Label("Add Item", systemImage: "plus")
                    //                            }
                    //                        }
                    ToolbarItem {
                        NavigationLink(destination: AddToDoView()) {
                            Label("Add Item", systemImage: "plus.circle.fill")
                        }
                    }
                }
            }
            
        }
        
    }

    private func deleteToDos(offsets: IndexSet) {
        withAnimation {
            offsets.map { toDos[$0] }.forEach(viewContext.delete)

            try? viewContext.save()
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
        }
    }
}


struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ToDoListView()
    }
}
