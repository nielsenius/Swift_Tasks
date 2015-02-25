//
//  TaskDetailsViewController.swift
//  Tasks
//
//  Created by Matthew Nielsen on 2/24/15.
//  Copyright (c) 2015 Matthew Nielsen. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailsViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    @IBOutlet var taskDetails: UITextField?
    
    var task: Tasks? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task != nil {
            taskDetails!.text = task!.details
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTask() {
        let entityDescripition = NSEntityDescription.entityForName("Tasks", inManagedObjectContext: managedObjectContext!)
        let task = Tasks(entity: entityDescripition!, insertIntoManagedObjectContext: managedObjectContext)
        task.details = taskDetails!.text
        managedObjectContext?.save(nil)
    }
    
    func editTask() {
        task?.details = taskDetails!.text
        managedObjectContext!.save(nil)
    }
    @IBAction func done(sender: AnyObject) {
        if task != nil {
            editTask()
        } else {
            createTask()
        }
        dismissViewController()
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewController()
    }
    
    func dismissViewController() {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
