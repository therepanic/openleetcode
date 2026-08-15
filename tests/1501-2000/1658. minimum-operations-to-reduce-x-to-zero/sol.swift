class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var sub_sum = nums.reduce(0, +) - x
        let n = nums.count
        var opes = n
        if sub_sum == 0 { return n }
        var l = 0, r = 0, sld_sum = 0
        
        while r < n {
            if sld_sum == sub_sum {
                opes = min(opes, n - (r - l))
            }
            sld_sum += nums[r]
            while l < r && sld_sum > sub_sum {
                sld_sum -= nums[l]
                l += 1
            }
            r += 1
        }

        if sld_sum == sub_sum {
            opes = min(opes, n - (r - l))
        }

        return opes == n ? -1 : opes
    }
}
