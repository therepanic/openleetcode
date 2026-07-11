class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var nums = nums
        var i = 0
        var j = 1
        let n = nums.count
        
        while i < n && j < n {
            if nums[i] % 2 == 0 {
                i += 2
            } else if nums[j] % 2 == 1 {
                j += 2
            } else {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                i += 2
                j += 2
            }
        }
        return nums
    }
}
