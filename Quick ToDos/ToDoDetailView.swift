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
            .bold()
            .font(.title)
            
    }
    
}

struct ToDoDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
        }
    }
}
