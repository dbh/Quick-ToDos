//
//  ToDoDetailView.swift
//  Quick ToDos
//
//  Created by Dovid Harrison on 10/25/22.
//

import SwiftUI

struct ToDoDetailView: View {
    var toDo : ToDo
    
    var body: some View {
        Text(toDo.title!)
            .font(.largeTitle)
            .padding()
        }
            
    }
    


struct ToDoDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ToDoDetailView(toDo: ToDo())
        }
    }
}
