//
//  ViewController.swift
//  BeerBar
//
//  Created by Виктор Васильков on 16.02.22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var menu: [UILabel]!
    
    @IBOutlet weak var markCashbox: UILabel!
    
    @IBOutlet weak var startNewDay: UIButton!
    
    @IBOutlet weak var daysOnWork: UILabel!
    
    @IBOutlet var litres05: [UIButton]!
    
    @IBOutlet var litres10: [UIButton]!
    
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        markMenu()
        markCashbox.text = "Now cashbox: \(Barmanager.shared.cashbox) $"

    }
    
//MARK: - Mark Buttons
    func markMenu() {
        for paragraphmenu in menu {
            paragraphmenu.text = """
                            Name: \(Barmanager.shared.beers[i].name),
                            Price: \(Barmanager.shared.beers[i].price)$,
                            Country: \(Barmanager.shared.beers[i].sendingCountry)
                            Remainder: \(Barmanager.shared.beers[i].remainderVolume)
                            """
            i += 1
            }
        for i in litres05 {
            i.setTitle("0.5 L", for: .normal)
        }
        for i in litres10 {
            i.setTitle("1.0 L", for: .normal)
        }
        startNewDay.setTitle("hand over the cashier", for: .normal)
        daysOnWork.text = "Our BAR works: \(Barmanager.shared.ourBarWorks) day"
        i = 0
    }

//MARK: - WhatHappendWhanPushButton
    
    //0.5
    
    @IBAction func pushButton05(_ sender: UIButton) {
        let name = Barmanager.shared.beers[sender.tag].name
        let xyz = sender.tag
        Barmanager.shared.buyBeer(name)
        markCashbox.text = "Now cashbox: \(Barmanager.shared.cashbox) $"
        Barmanager.shared.beers[xyz].remainderVolume -= 0.5
        markMenu()
    }
        
    //1.0
    
    @IBAction func pushButton10(_ sender: UIButton) {
        let name = Barmanager.shared.beers[sender.tag].name
        let xzz = sender.tag
        Barmanager.shared.buyBeer(name)
        markCashbox.text = "Now cashbox: \(Barmanager.shared.cashbox) $"
        Barmanager.shared.buyBeer(name)
        markCashbox.text = "Now cashbox: \(Barmanager.shared.cashbox) $"
        Barmanager.shared.beers[xzz].remainderVolume -= 1
        markMenu()
    
    }
    @IBAction func pushstartNewDay(_ sender: UIButton) {
        Barmanager.shared.newDay()
        markCashbox.text = "Now cashbox: \(Barmanager.shared.cashbox) $"
        daysOnWork.text = "Our BAR works: \(Barmanager.shared.ourBarWorks) day"
    }
        
    

}

