class Solution {
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var i = k, j = k
        var curMin = nums[k]
        var res = curMin

        while i > 0 || j < n - 1 {
            if i == 0 {
                j += 1
            } else if j == n - 1 {
                i -= 1
            } else if nums[i - 1] >= nums[j + 1] {
                i -= 1
            } else {
                j += 1
            }
            curMin = min(curMin, nums[i], nums[j])
            res = max(res, curMin * (j - i + 1))
        }

        return res
    }
}
