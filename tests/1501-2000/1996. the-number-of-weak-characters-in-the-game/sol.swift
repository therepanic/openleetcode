class Solution {
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        let sorted = properties.sorted { 
            if $0[0] != $1[0] { return $0[0] > $1[0] }
            return $0[1] < $1[1]
        }
        
        var maxDefense = 0
        var weakCount = 0
        
        for prop in sorted {
            if prop[1] < maxDefense {
                weakCount += 1
            } else {
                maxDefense = prop[1]
            }
        }
        
        return weakCount
    }
}
