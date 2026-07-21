class Solution {
    func peopleIndexes(_ favoriteCompanies: [[String]]) -> [Int] {
        let sets = favoriteCompanies.map { Set($0) }
        var result: [Int] = []
        
        for i in sets.indices {
            var isSubset = false
            for j in sets.indices {
                if i != j && sets[i].isSubset(of: sets[j]) {
                    isSubset = true
                    break
                }
            }
            if !isSubset {
                result.append(i)
            }
        }
        
        return result
    }
}
