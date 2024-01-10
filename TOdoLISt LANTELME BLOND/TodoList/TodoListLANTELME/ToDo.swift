//
//  ToDo.swift
//  TodoList
//
//  Created by ESIREM
//

import Foundation

class ToDo: Equatable {
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.name == rhs.name && lhs.priority == rhs.priority
    }
    
    var name: String = ""
    var priority: Int = 0
}
