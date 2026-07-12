class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        let n = nums.count
        if nums[0] < nums[n - 1] {
            for i in 1..<n {
                if nums[i] < nums[i - 1] {
                    return false
                }
            }
        } else {
            for i in 1..<n {
                if nums[i] > nums[i - 1] {
                    return false
                }
            }
        }
        return true
    }
}
