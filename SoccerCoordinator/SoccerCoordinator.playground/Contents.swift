import Foundation

let soccerPlayers = ["Joe Smith": [42, true, "Jim and Jan Smith"],
               "Jill Tanner": [36, true, "Clara Tanner"],
               "Bill Bon": [43, true, "Sara and Jenny Bon"],
               "Eva Gordon": [45, false, "Wendy and Mike Gordon"],
               "Matt Gill": [40, false, "Charles and Sylvia Gill"],
               "Kimmy Stein": [41, false, "Bill and Hillary Stein"],
               "Sammy Adams": [45, false, "Jeff Adams"],
               "Karl Saygan": [42, true, "Heather Biedsoe"],
               "Suzane Greenberg": [44, true, "Henrietta Dumas"],
               "Sal Dali": [41, false, "Gala Dali"],
               "Joe Kavalier": [39, false, "Sam and Elaine Kavalier"],
               "Ben Finkelstein": [44, false, "Aaron and Jill Finkelstein"],
               "Diego Soto": [41, true, "Robin and Sarika Soto"],
               "Chloe Alaska": [47, false, "David and Jamie Alaska"],
               "Arnold Willis": [43, false, "Claire Willis"],
               "Philip Helm": [44, true, "Thomas Helm and Eva Jones"],
               "Les Clay": [42, true, "Wynonna Brown"],
               "Herschel Krustofski": [45, true, "Hyman and Rachel Krustofski"]]

var sharks = [String: Array<AnyObject>]()
var dragons = [String: Array<AnyObject>]()
var raptors = [String: Array<AnyObject>]()

let theSharksGame = "March 17 at 3PM"
let theDragonsGame = "March 17 at 1PM"
let theRaptorsGame = "March 18 at 1PM"


// Here, I am making sure that experienced players are separated from inexperienced players to make it easier to assign each player to a team evenly

func numOfExperienced() -> Int {
    var experienced = 0
    
    for playerDetails in soccerPlayers.values {
        if playerDetails[1] as! Bool == true {
            experienced += 1
        }
    }
    return experienced
}

// numOfExpPlayers is now the func method above
var numOfExpPlayers = numOfExperienced()
var numOfInExpPlayers = soccerPlayers.count - numOfExpPlayers


// used for loop with if statements in order to divide the teams into an even amount of experienced and inexperienced players on each teams.

for (key, value) in soccerPlayers {
    
    if sharks.count < soccerPlayers.count / 3 && sharks.count / 2 <= numOfExpPlayers / 3 && sharks.count / 2 <= numOfInExpPlayers / 3 {
        sharks[key] = value as [AnyObject]?
    } else if dragons.count < soccerPlayers.count / 3 && dragons.count / 2 <= numOfExpPlayers / 3 && dragons.count / 2 <= numOfInExpPlayers / 3 {
        dragons[key] = value as [AnyObject]?
    } else if raptors.count < soccerPlayers.count / 3 && raptors.count / 2 <= numOfExpPlayers / 3 && raptors.count / 2  <= numOfInExpPlayers / 3 {
        raptors[key] = value as [AnyObject]?
    } else {
        print ("Cannot assign \(key, value) ")
    }
}


func printLetters() {
    for (key, value) in sharks {
        print("Hello \(value[2]), we would like to inform you that your son \(key) will be playing his first game with the Sharks team! We hope that you will be able to attend on \(theSharksGame)")
    }
    
    for (key, value) in dragons {
        print("Hello \(value[2]), we would like to inform you that your son \(key) will be playing his first game with the Dragons team! We hope that you will be able to attend on \(theDragonsGame)")
    }
    
    for (key, value) in raptors {
        print("Hello \(value[2]), we would like to inform you that your son \(key) will be playing his first game with the Raptors team! We hope that you will be able to attend on \(theRaptorsGame)")
    }
}

printLetters()


// The average heights of each team and stored them in an Array.

func teamsAverageHeights() -> [Int] {
    var sharksTotalHeight: Int = 0
    var dragonsTotalHeight: Int = 0
    var raptorsTotalHeight: Int = 0
    
    // The key concept here was not being used, so "(_, value)" would be a valid approach
    // as!, attempts the downcast and force-unwraps the result as a single compound action
    for (_, value) in sharks {
        sharksTotalHeight += value[0] as! Int
    }
    for (_, value) in dragons {
        dragonsTotalHeight += value[0] as! Int
    }
    for (_, value) in raptors {
        raptorsTotalHeight += value[0] as! Int
    }
    
    
    return [sharksTotalHeight / (soccerPlayers.count / 3), dragonsTotalHeight / (soccerPlayers.count / 3), raptorsTotalHeight / (soccerPlayers.count / 3)]
}

teamsAverageHeights()


