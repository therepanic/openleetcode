class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        let times = timePoints.map { time -> Int in
            let parts = time.split(separator: ":")
            let h = Int(parts[0])!
            let m = Int(parts[1])!
            return h * 60 + m
        }.sorted()
        var minDiff = Int.max
        for i in 1..<times.count {
            minDiff = min(minDiff, times[i] - times[i - 1])
        }
        minDiff = min(minDiff, 1440 + times[0] - times[times.count - 1])
        return minDiff
    }
}
