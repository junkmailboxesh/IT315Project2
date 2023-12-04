//
//  ViewController.swift
//  Project2
//
//  Created by Andrew Kubat on 12/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    var SplitViewGhost:Ghost = Ghost()
    
    var ghostObjectArray = [Ghost]()
    
    var globalGhost = Ghost()
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEvidOne: UILabel!
    @IBOutlet weak var lblEvidTwo: UILabel!
    @IBOutlet weak var lblEvidThree: UILabel!
    
    @IBOutlet weak var lblStrength: UILabel!
    @IBOutlet weak var lblWeakness: UILabel!
    
    @IBOutlet weak var lblSpeed: UILabel!
    
    @IBOutlet weak var lblMaxHunt: UILabel!
    @IBOutlet weak var lblMinHunt: UILabel!
    
    @IBOutlet weak var imgGhostyBOI: UIImageView!
    
    @IBAction func btnWiki(_ sender: Any) {
        let browserApp = UIApplication.shared
        //globalHT is a global variable that is set in the SetLables Function.
        // this global varaible is used to pass values between functions.
        let url = URL(string: globalGhost.WikiLink)
        browserApp.open(url!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    func randomGhostImg(){
        var potentials: [String] = ["https://static.wikia.nocookie.net/phasmophobia/images/f/fb/2.png/revision/latest?cb=20211102022657", "https://static.wikia.nocookie.net/phasmophobia/images/f/f2/Ghost_Argyro.png/revision/latest?cb=20211109064823","https://static.wikia.nocookie.net/phasmophobia/images/c/cf/Ghost_CreepyGirl.png/revision/latest?cb=20211109064826", "https://static.wikia.nocookie.net/phasmophobia/images/a/ae/Ghost_Male_Nerd.png/revision/latest?cb=20211102022831", "https://static.wikia.nocookie.net/phasmophobia/images/d/d3/Ghost_Male_Sofia.png/revision/latest?cb=20211102022831", "https://static.wikia.nocookie.net/phasmophobia/images/5/55/Ghost_Male_Butcher.png/revision/latest?cb=20211102022831"]
        var chosen = potentials.randomElement()!
        var img = convertToImage(urlString: chosen)
        imgGhostyBOI.image = img
        
    }
    
    func convertToImage(urlString: String) -> UIImage {
        let imgURL = URL(string:urlString)!
        let imgData  = try? Data(contentsOf: imgURL)
        let img = UIImage(data: imgData!)
        return img!
    }    
    
    func setLabels(){
        let ghosty = SplitViewGhost
        globalGhost = ghosty
        lblName.text = ghosty.GhostName
        lblEvidOne.text = ghosty.EvidOne
        lblEvidTwo.text = ghosty.EvidTwo
        lblEvidThree.text = ghosty.EvidThree
        lblStrength.text = ghosty.Strength
        lblWeakness.text = ghosty.Weakness
        lblSpeed.text = ghosty.Speed
        lblMaxHunt.text = ghosty.MaxHuntThreshold
        lblMinHunt.text = ghosty.MinHuntThreshold
        
        randomGhostImg()
        
        
        
    }
}

