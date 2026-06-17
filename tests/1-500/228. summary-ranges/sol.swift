class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var result: [String] = []
        var i = 0
        
        while i < nums.count {
            let start = nums[i]
            var j = i
            while j + 1 < nums.count && nums[j + 1] == nums[j] + 1 {
                j += 1
            }
            
            if nums[j] == start {
                result.append(String(start))
            } else {
                result.append("\(start)->\(nums[j])")
            }
            
            i = j + 1
        }
        
        return result
    }
}
