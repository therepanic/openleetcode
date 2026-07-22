class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var startCities = Set<String>()
        
        for path in paths {
            startCities.insert(path[0])
        }
        
        for path in paths {
            if !startCities.contains(path[1]) {
                return path[1]
            }
        }
        
        return ""
    }
}
