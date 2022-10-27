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
    @FocusState var titleFocus: Bool
    
    @State var toDoTitle = ""
    
    var body: some View {
        VStack {
            TextField("Type your ToDo Text", text: $toDoTitle)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .focused($titleFocus)
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

            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                titleFocus = true
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
