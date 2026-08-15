class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        var arrival = [Int]()
        for i in 0..<dist.count {
            arrival.append((dist[i] + speed[i] - 1) / speed[i])
        }
        arrival.sort()
        for minute in 0..<arrival.count {
            if arrival[minute] <= minute {
                return minute
            }
        }
        return arrival.count
    }
}
