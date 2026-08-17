class Solution {
    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
        if dist.isEmpty { return -1 }
        
        func canReach(_ speed: Int) -> Bool {
            var total = 0.0
            for i in 0..<(dist.count - 1) {
                total += Double((dist[i] + speed - 1) / speed)
            }
            total += Double(dist[dist.count - 1]) / Double(speed)
            return total <= hour
        }
        
        var low = 1, high = 10000000, ans = -1
        while low <= high {
            let mid = (low + high) / 2
            if canReach(mid) {
                ans = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return ans
    }
}
