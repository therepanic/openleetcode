class Solution {
    func minMoves(_ nums: [Int], _ k: Int) -> Int {
        var idx: [Int] = []
        for (i, val) in nums.enumerated() {
            if val == 1 {
                idx.append(i)
            }
        }
        let n = idx.count
        var a = [Int](repeating: 0, count: n)
        for i in 0..<n {
            a[i] = idx[i] - i
        }
        var prefix = [Int](repeating: 0, count: n)
        if n > 0 {
            prefix[0] = a[0]
            for i in 1..<n {
                prefix[i] = prefix[i-1] + a[i]
            }
        }
        var ans = Int.max
        var l = 0
        for r in 0..<n {
            while r - l + 1 > k {
                l += 1
            }
            if r - l + 1 == k {
                let mid = (l + r) / 2
                let med = a[mid]
                let leftSum = prefix[mid] - (l > 0 ? prefix[l-1] : 0)
                let rightSum = prefix[r] - prefix[mid]
                let cost = (med * (mid - l + 1) - leftSum) + (rightSum - med * (r - mid))
                ans = min(ans, cost)
            }
        }
        return ans
    }
}
