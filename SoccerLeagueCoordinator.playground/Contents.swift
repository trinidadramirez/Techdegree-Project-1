/*
    The Soccer League Coordinator program project will divide 18 children into three different teams to the best
    of its ability. The allocation is for the sake of keeping the teams as evenly matched as possible.
 */

/*
    Array and constant declarations
*/

// Declares an index variable for iteration through the experienced and inexperienced players arrays
var index : Int = 0

// Declares variables that store each teams average height
var dragonsAverageHeight : Double = 0.00
var sharksAverageHeight : Double = 0.00
var raptorsAverageHeight : Double = 0.00

// Declares a variable that stores a running height difference that will be used to even teams out based on average height
var heightDifference : Double = 0.00

// Declares variables to store each teams height total
var dragonsHeightTotal : Double = 0.00
var sharksHeightTotal : Double = 0.00
var raptorsHeightTotal : Double = 0.00

// Creates an empty dictionary array to store each player's dictionary of personal information
var players = [[String : Any]]()

// Declare arrays for each team: Dragons, Sharks, Raptors
var teamDragons = [[String : Any]]()
var teamSharks = [[String : Any]]()
var teamRaptors = [[String : Any]]()

// Creates an array to store the experienced players and an array to store the inexperienced players
var experiencedPlayers = [[String : Any]]()
var inexperiencedPlayers = [[String : Any]]()

// Creates an array to store the personal letters
var letters : Array<String> = []

// Assign dictonary keys to variables
let name : String = "name"
let height : String = "height"
let experience : String = "experience"
let guardians : String = "guardians"

// Creates individual constant dictionaries to store each player's personal information
let joeSmith : [String : Any] = ["name" : "Joe Smith", "height" : 42.00, "experience" : true, "guardians" : "Jim and Jan Smith"]
let jillTanner : [String : Any] = ["name" : "Jill Tanner", "height" : 36.00, "experience" : true, "guardians" : "Clara Tanner"]
let billBon : [String : Any] = ["name" : "Bill Bon", "height" : 43.00, "experience" : true, "guardians" : "Sara and Jenny Bon"]
let evaGordon : [String : Any] = ["name" : "Eva Gordon", "height" : 45.00, "experience" : false, "guardians" : "Wendy and Mike Gordon"]
let mattGill : [String : Any] = ["name" : "Matt Gill", "height" : 40.00, "experience" : false, "guardians" : "Charles and Sylvia Gill"]
let kimmyStein : [String : Any] = ["name" : "Kimmy Stein", "height" : 41.00, "experience" : false, "guardians" : "Bill and Hillary Stein"]
let sammyAdams : [String : Any] = ["name" : "Sammy Adams", "height" : 45.00, "experience" : false, "guardians" : "Jeff Adams"]
let karlSaygan : [String : Any] = ["name" : "Karl Saygan", "height" : 42.00, "experience" : true, "guardians" : "Heather Bledsoe"]
let suzaneGreenberg : [String : Any] = ["name" : "Suzane Greenberg", "height" : 44.00, "experience" : true, "guardians" : "Henrietta Dumas"]
let salDali : [String : Any] = ["name" : "Sal Dali", "height" : 41.00, "experience" : false, "guardians" : "Gala Dali"]
let joeKavalier : [String : Any] = ["name" : "Joe Kavalier", "height" : 39.00, "experience" : false, "guardians" : "Sam and Elaine Kavalier"]
let benFinkelstein : [String : Any] = ["name" : "Ben Finkelstein", "height" : 44.00, "experience" : false, "guardians" : "Aaron and Jill Finkelstein"]
let diegoSoto : [String : Any] = ["name" : "Diego Soto", "height" : 41.00, "experience" : true, "guardians" : "Robin and Sarika Soto"]
let chloeAlaska : [String : Any] = ["name" : "Chloe Alaska", "height" : 47.00, "experience" : false, "guardians" : "David and Jamie Alaska"]
let arnoldWillis : [String : Any] = ["name" : "Arnold Willis", "height" : 43.00, "experience" : false, "guardians" : "Claire Willis"]
let phillipHelm : [String : Any] = ["name" : "Phillip Helm", "height" : 44.00, "experience" : true, "guardians" : "Thomas Helm and Eva Jones"]
let lesClay : [String : Any] = ["name" : "Les Clay", "height" : 42.00, "experience" : true, "guardians" : "Wynonna Brown"]
let herschelKrustofski : [String : Any] = ["name" : "Herschel Krustofski", "height" : 45.00, "experience" : true, "guardians" : "Hyman and Rachel Krustofski"]

// Append each player to the players array
players.append(joeSmith)
players.append(jillTanner)
players.append(billBon)
players.append(evaGordon)
players.append(mattGill)
players.append(kimmyStein)
players.append(sammyAdams)
players.append(karlSaygan)
players.append(suzaneGreenberg)
players.append(salDali)
players.append(joeKavalier)
players.append(benFinkelstein)
players.append(diegoSoto)
players.append(chloeAlaska)
players.append(arnoldWillis)
players.append(phillipHelm)
players.append(lesClay)
players.append(herschelKrustofski)

// This function iterates through players array and organizes players into two groups depending on whether they have experience or not
func allocatePlayersByExperience() -> Void {
    for player in players {
        if player[experience] as! Bool == true {
            experiencedPlayers.append(player)
        } else {
            inexperiencedPlayers.append(player)
        }
    }
}

// This function divides the experienced and inexperienced players evenly to each team
func buildTeams() -> Void {
    while index < experiencedPlayers.count {
        teamDragons.append(experiencedPlayers[index])
        teamSharks.append(experiencedPlayers[index + 1])
        teamRaptors.append(experiencedPlayers[index + 2])
        index += 3
    }

    // Reset index to 0
    index = 0

    // Divide the inexperienced players evenly to each team
    while index < experiencedPlayers.count {
        teamDragons.append(inexperiencedPlayers[index])
        teamSharks.append(inexperiencedPlayers[index + 1])
        teamRaptors.append(inexperiencedPlayers[index + 2])
        index += 3
    }
}

// Allocates players by skill and generates fair teams
allocatePlayersByExperience()
buildTeams()

// This function finds each team's height total, and calculates the average
func getTeamsAverageHeight() -> Void {
    index = 0

    for dragonsPlayer in teamDragons {
        dragonsHeightTotal += dragonsPlayer[height] as! Double
        index += 1
        
        if index == teamDragons.count {
            dragonsAverageHeight = (dragonsHeightTotal / Double(teamDragons.count))
            index = 0
        }
    }

    for sharksPlayer in teamSharks {
        sharksHeightTotal += sharksPlayer[height] as! Double
        index += 1
        
        if index == teamSharks.count {
            sharksAverageHeight = (sharksHeightTotal / Double(teamSharks.count))
            index = 0
        }
    }

    for raptorsPlayer in teamRaptors {
        raptorsHeightTotal += raptorsPlayer[height] as! Double
        index += 1
        
        if index == teamRaptors.count {
            raptorsAverageHeight = (raptorsHeightTotal / Double(teamRaptors.count))
            index = 0
        }
    }
}

// Get each team's average height
getTeamsAverageHeight()

// Print each team's average height to the console
print(dragonsAverageHeight)
print(sharksAverageHeight)
print(raptorsAverageHeight)

// This functon consolidates the personal letters into one array
func consolidateLetters() -> Void {
    for dragonsPlayer in teamDragons {
        letters.append("Hello \(dragonsPlayer[guardians]!), \(dragonsPlayer[name]!) has been selected to play for the Dragons this season. The first day of practice is March 17, 1pm.")
    }

    for sharksPlayer in teamSharks {
        letters.append("Hello \(sharksPlayer[guardians]!), \(sharksPlayer[name]!) has been selected to play for the Sharks this season. The first day of practice is March 17, 3pm.")
    }

    for raptorsPlayer in teamRaptors {
        letters.append("Hello \(raptorsPlayer[guardians]!), \(raptorsPlayer[name]!) has been selected to play for the Raptors this season. The first day of practice is March 18, 1pm.")
    }
}

// This function prints each personalized letter to the console
func printLetters() -> Void {
    for letter in letters {
        print(letter)
    }
}

// Consolidates all personal letters into one location before printing them to the console
consolidateLetters()
printLetters()