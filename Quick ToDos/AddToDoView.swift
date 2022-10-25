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

    @State var toDoTitle = ""
    
    var body: some View {
        TextField("Type your ToDo Text", text: $toDoTitle)
            .padding()
            .toolbar {
                Button(action: {
                    let newToDo = ToDo(context: viewContext)
                    newToDo.title = toDoTitle
                    
                    do {
                        try viewContext.save()
                        toDoTitle = ""
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }) {
                    Text("Add to list")
                }
            }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddToDoView()
        }
    }
}
