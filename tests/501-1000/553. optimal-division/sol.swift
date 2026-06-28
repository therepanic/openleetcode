class Solution {
    func optimalDivision(_ nums: [Int]) -> String {
        var result = String(nums[0])
        
        if nums.count == 1 {
            return result
        }
        
        if nums.count == 2 {
            return result + "/" + String(nums[1])
        }
        
        result += "/(" + String(nums[1])
        for i in 2..<nums.count {
            result += "/" + String(nums[i])
        }
        
        return result + ")"
    }
}
