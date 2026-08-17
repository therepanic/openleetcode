class Solution {
    func waysToSplit(_ nums: [Int]) -> Int {
        let MOD = 1_000_000_007
        let n = nums.count
        var prefix = [Int](repeating: 0, count: n)
        prefix[0] = nums[0]
        
        for i in 1..<n {
            prefix[i] = prefix[i - 1] + nums[i]
        }
        
        var res = 0
        for i in 0..<(n - 2) {
            let left = prefix[i]
            let j = lowerBound(prefix, 2 * left, i + 1, n - 1)
            let k = upperBound(prefix, (prefix[n - 1] + left) / 2, j, n - 1)
            if j < k {
                res = (res + (k - j)) % MOD
            }
        }
        return res
    }
    
    private func lowerBound(_ arr: [Int], _ target: Int, _ lo: Int, _ hi: Int) -> Int {
        var l = lo, h = hi
        while l < h {
            let mid = (l + h) / 2
            if arr[mid] < target {
                l = mid + 1
            } else {
                h = mid
            }
        }
        return l
    }
    
    private func upperBound(_ arr: [Int], _ target: Int, _ lo: Int, _ hi: Int) -> Int {
        var l = lo, h = hi
        while l < h {
            let mid = (l + h) / 2
            if arr[mid] <= target {
                l = mid + 1
            } else {
                h = mid
            }
        }
        return l
    }
}
