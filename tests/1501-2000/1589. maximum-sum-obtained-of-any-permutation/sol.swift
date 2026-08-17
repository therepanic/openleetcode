class Solution {
    func maxSumRangeQuery(_ nums: [Int], _ requests: [[Int]]) -> Int {
        var events: [(Int, Int)] = []
        let mod = 1_000_000_007
        
        for req in requests {
            events.append((req[0], 1))
            events.append((req[1]+1, -1))
        }
        
        events.sort { $0.0 < $1.0 }
        
        var cnt = 0
        var prev = -1
        var weight: [Int: Int] = [:]
        
        for (pos, delta) in events {
            if prev != -1 && cnt != 0 {
                weight[cnt, default: 0] += pos - prev
            }
            prev = pos
            cnt += delta
        }
        
        let sorted = weight.sorted { $0.key > $1.key }
        
        var numsSorted = nums.sorted(by: >)
        var ans = 0
        var idx = 0
        
        for (wg, num) in sorted {
            for _ in 0..<num {
                ans = (ans + numsSorted[idx] * wg) % mod
                idx += 1
            }
        }
        
        return ans
    }
}
