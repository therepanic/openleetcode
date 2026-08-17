class Solution {
    func alertNames(_ keyName: [String], _ keyTime: [String]) -> [String] {
        var map = [String: [Int]]()
        
        for i in 0..<keyName.count {
            let parts = keyTime[i].split(separator: ":")
            let minutes = Int(parts[0])! * 60 + Int(parts[1])!
            map[keyName[i], default: []].append(minutes)
        }
        
        var result = [String]()
        
        for (name, times) in map {
            let sortedTimes = times.sorted()
            if sortedTimes.count < 3 { continue }
            for i in 0...(sortedTimes.count - 3) {
                if sortedTimes[i+2] - sortedTimes[i] <= 60 {
                    result.append(name)
                    break
                }
            }
        }
        
        return result.sorted()
    }
}
