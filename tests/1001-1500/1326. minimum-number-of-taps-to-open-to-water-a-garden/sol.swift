class Solution {
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        var maxRange = [Int](repeating: 0, count: n + 1)
        
        for i in 0..<ranges.count {
            let left = max(0, i - ranges[i])
            let right = min(n, i + ranges[i])
            maxRange[left] = max(maxRange[left], right)
        }
        
        var end = 0, farthest = 0, taps = 0
        var i = 0
        
        while end < n {
            while i <= end {
                farthest = max(farthest, maxRange[i])
                i += 1
            }
            
            if farthest <= end {
                return -1
            }
            
            end = farthest
            taps += 1
        }
        
        return taps
    }
}
