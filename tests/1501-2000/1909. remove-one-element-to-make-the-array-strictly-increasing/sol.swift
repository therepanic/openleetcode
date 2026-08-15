class Solution {
    func canBeIncreasing(_ nums: [Int]) -> Bool {
        let n = nums.count
        var idx = -1
        
        for i in 0..<(n - 1) {
            if nums[i] >= nums[i + 1] {
                idx = i
                break
            }
        }
        
        var flag = true
        for i in (idx + 1)..<(n - 1) {
            if nums[i] >= nums[i + 1] {
                flag = false
                break
            }
        }
        
        if (idx == 0 || idx == n - 1) && flag { return true }
        if idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] < nums[idx + 1] && flag { return true }
        
        for i in stride(from: n - 1, through: 1, by: -1) {
            if nums[i] <= nums[i - 1] {
                idx = i
                break
            }
        }
        
        flag = true
        for i in stride(from: idx - 1, through: 1, by: -1) {
            if nums[i] <= nums[i - 1] {
                flag = false
                break
            }
        }
        
        if (idx == 0 || idx == n - 1) && flag { return true }
        if idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] >= nums[idx + 1] { return false }
        return flag
    }
}
