//
//  TodoTableViewController.swift
//  TodoList
//
//  Created by ESIREM
//

import UIKit

class TodoTableViewController: UITableViewController {
    var toDos : [ToDo] = []
    
   

   
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedTodo = toDos[indexPath.row]
        
        if selectedTodo.priority == 1 {
            cell.textLabel?.text = "1-" + selectedTodo.name
        }
        else if selectedTodo.priority == 2 {
            cell.textLabel?.text = "2-" + selectedTodo.name
        }
        else {
            cell.textLabel?.text = selectedTodo.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addTodoViewController = segue.destination as? AddTodoViewController {
            addTodoViewController.toDoTableViewController = self
        }
        
        if let detailsTodViewController = segue.destination as? TodoDetailViewController {
            if let selectedToDo = sender as? ToDo {
                detailsTodViewController.toDo = selectedToDo
                detailsTodViewController.toDoTableViewController = self
            }
        }
    }
}
