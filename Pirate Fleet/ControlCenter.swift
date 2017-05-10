//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_{
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {

        let smallShip1 = Ship(length: 2, location: GridLocation(x:3, y:3), isVertical: true)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x:1, y:0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x:4, y:2), isVertical: false)
        let largeShip1 = Ship(length: 4, location: GridLocation(x:2, y:6), isVertical: false)
        let xlargeShip1 = Ship(length: 5, location: GridLocation(x:0,y:0), isVertical: true)
        
        let mine1 = Mine(location: GridLocation(x:7,y:0), explosionText: "Boom")
        let mine2 = Mine(location: GridLocation(x:7,y:7), explosionText: "Boom Boom Pow")
        
        human.addShipToGrid(smallShip1)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip1)
        human.addShipToGrid(xlargeShip1)
      
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = 0                
        
        let shipBonus = gameStats.shipBonus
        let sinkBonus = gameStats.sinkBonus
        let guessPenalty = gameStats.guessPenalty
        
        let humanShipsRemaining = 5 - gameStats.humanShipsSunk
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        
        let enemyShipsSunk = 5 - gameStats.enemyShipsRemaining
        
        finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
        print("the value of final score is \(finalScore)")
        return finalScore
    }
}
