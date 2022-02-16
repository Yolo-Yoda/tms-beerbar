//
//  Barmanager.swift
//  BeerBar
//
//  Created by Виктор Васильков on 16.02.22.
//

import UIKit

class Barmanager {
    struct Beer {
        let name: String
        let price: Double
        let sendingCountry: String
        var remainderVolume : Double
    }
    var beers: [Beer] = [Beer(name: "Arctic Ale", price: 7.89, sendingCountry: "British", remainderVolume: 100),
                        Beer(name: "Loerik 1998", price: 3.44, sendingCountry: "Belgium", remainderVolume: 100),
                         Beer(name: "Antarctic Nail Ale", price: 3.63, sendingCountry: "Avsralian", remainderVolume: 100),
                         Beer(name: "The End of History", price: 2.16, sendingCountry: "USA", remainderVolume: 100),
                         Beer(name: "Westvleteren XII", price: 1.35, sendingCountry: "Belgium", remainderVolume: 100)]
    var cashbox: Double
    var ourBarWorks: Int
    
    static public var shared: Barmanager = Barmanager()
    
    private init() { self.cashbox = 0; self.ourBarWorks = 0 }
//MARK: - Buying
    
    func buyBeer(_ name: String) -> Double {
        guard let buyingBeer = beers.filter({ $0.name == name }).first else { return 0 }
        let price = buyingBeer.price
        cashbox += price
        return cashbox
    }

//MARK: - CountMoneyinCashBox
    
    func countMoney() -> Double {
        cashbox
    }
    
//MARK: - StartNewDay
    
    func newDay () -> Double {
        cashbox = 0
        ourBarWorks += 1
        return cashbox
    }

}
