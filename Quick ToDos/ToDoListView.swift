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
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ToDoListView()
    }
}
