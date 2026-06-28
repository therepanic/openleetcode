class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var nums = nums
        var i = 0
        while i < nums.count {
            let correct = nums[i] - 1
            if nums[i] != nums[correct] {
                nums.swapAt(i, correct)
            } else {
                i += 1
            }
        }
        
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return [nums[i], i + 1]
            }
        }
        return []
    }
}
