//
//  AddToDoView.swift
//  Quick ToDos
//
//  Created by Dovid Harrison on 10/25/22.
//

import SwiftUI
import CoreData

struct AddToDoView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var toDoTitle = ""
    
    var body: some View {
        TextField("Type your ToDo Text", text: $toDoTitle)
            .submitLabel(.go)
            .onSubmit {
                addToDo()
            }
            .padding()
            .toolbar {
                Button(action: {
                    addToDo()
                }) {
                    Text("Add to list")
                }
            }
    }
    
    func addToDo() {
        if toDoTitle.isEmpty {
            print("Empty data")
            return
        }
        
        let newToDo = ToDo(context: viewContext)
        newToDo.title = toDoTitle
        
        
        try? viewContext.save()
        
        presentationMode.wrappedValue.dismiss()
//                    do {
//                        try viewContext.save()
//                        toDoTitle = ""
//                    } catch {
//                        let nsError = error as NSError
//                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//                    }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddToDoView()
        }
    }
}
