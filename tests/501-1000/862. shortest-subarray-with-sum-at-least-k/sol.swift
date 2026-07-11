class Solution {
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var prefix = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            prefix[i + 1] = prefix[i] + nums[i]
        }
        
        var best = n + 1
        var dq = [Int]()
        for i in 0..<prefix.count {
            while !dq.isEmpty && prefix[i] - prefix[dq[0]] >= k {
                best = min(best, i - dq.removeFirst())
            }
            while !dq.isEmpty && prefix[dq.last!] >= prefix[i] {
                dq.removeLast()
            }
            dq.append(i)
        }
        
        return best == n + 1 ? -1 : best
    }
}
