//
//  TodoDetailViewController.swift
//  TodoList
//
//  Created by ESIREM
//

import UIKit

class TodoDetailViewController: UIViewController {

    var toDo = ToDo()
    var toDoTableViewController: TodoTableViewController?
    
    @IBOutlet weak var todoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if toDo.priority == 1 {
            todoLabel.text = "1-" + toDo.name
        }
        else if toDo.priority == 2 {
            todoLabel.text = "2-" + toDo.name
        }
        else {
            todoLabel.text = toDo.name
        }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        if let index = toDoTableViewController?.toDos.firstIndex(of: toDo) {
            toDoTableViewController?.toDos.remove(at: index)
            toDoTableViewController?.tableView.reloadData()
        }
        navigationController?.popViewController(animated: true)
    }


}
