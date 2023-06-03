import UIKit

var bixos = ["tiger", "skunk", "raccoon", "lion", "eagle", "bear", "baboon", "aardvark", "Toothless", "Old Yeller", "Big Bird"]

func sortAndFilter(_ stringArray: [String]) -> [String] {
        
        var filteredArray = stringArray.filter({ $0.lowercased().first != "a" && $0.lowercased().first != "e" && $0.lowercased().first != "i" && $0.lowercased().first != "o" && $0.lowercased().first != "u" })
        
    var sortedArray: [String] = filteredArray.sorted (by: { $0.lowercased() >= $1.lowercased()})
        
        return sortedArray
    }

sortAndFilter(bixos)
