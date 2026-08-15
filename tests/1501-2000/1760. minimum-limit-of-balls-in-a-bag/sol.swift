class Solution {
    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        var lo = 1
        var hi = nums.max()!
        while lo < hi {
            let mid = (lo + hi) / 2
            var needed = 0
            for x in nums {
                needed += (x - 1) / mid
            }
            if needed <= maxOperations {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}
