//
//  GhostListController.swift
//  Project2
//
//  Created by Andrew Kubat on 12/3/23.
//

import Foundation
import UIKit

class GhostListController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetJSONData()
        self.view.backgroundColor = UIColor.black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destController = segue.destination as! ViewController
        let index = tableView.indexPathForSelectedRow
        let selectedRowGhost = ghostObjectArray[index!.row]
        destController.SplitViewGhost = selectedRowGhost
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ghostObjectArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var myCell = tableView.dequeueReusableCell(withIdentifier: "GhostCellID")
        var cellIndex = indexPath.row
        let ghost = ghostObjectArray[cellIndex]
        
        myCell!.textLabel!.text = ghost.GhostName
        myCell!.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        myCell!.textLabel!.textColor = UIColor.red
        myCell!.textLabel!.backgroundColor = UIColor.black
        myCell!.backgroundColor = UIColor.black
        
        
        return myCell!
    }
    
    var ghostObjectArray = [Ghost]()
    
    func GetJSONData() {
        let endPointString = "https://raw.githubusercontent.com/junkmailboxesh/IT315Project2/main/ghostData.json"
        let endPointURL = URL(string: endPointString)
        
        let dataBytes = try? Data(contentsOf:endPointURL!)
        
        if(dataBytes != nil){
            let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with: dataBytes!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            
            let ghostDictionary = dictionary["Ghosts"]! as! [[String:AnyObject]]
            
            for index in 0...ghostDictionary.count - 1 {
                let singleGhost = ghostDictionary[index]
                let ghost = Ghost()
                ghost.GhostName = singleGhost["GhostName"] as! String
                ghost.EvidOne = singleGhost["EvidOne"] as! String
                ghost.EvidTwo = singleGhost["EvidTwo"] as! String
                ghost.EvidThree = singleGhost["EvidThree"] as! String
                ghost.Strength = singleGhost["Strength"] as! String
                ghost.Weakness = singleGhost["Weakness"] as! String
                ghost.Speed = singleGhost["Speed"] as! String
                ghost.MaxHuntThreshold = singleGhost["MaxHunt"] as! String
                ghost.MinHuntThreshold = singleGhost["MinHunt"] as! String
                ghost.WikiLink = singleGhost["WikiLink"] as! String
                ghostObjectArray.append(ghost)

                
            }
        }
    }
    
}
