class Solution {
    func arrayNesting(_ nums: [Int]) -> Int {
        var nums = nums
        var maxCount = 0
        
        for i in 0..<nums.count {
            if nums[i] == -1 {
                continue
            }
            
            var currentCount = 0
            var start = i
            
            while nums[start] != -1 {
                let nextNode = nums[start]
                nums[start] = -1
                start = nextNode
                currentCount += 1
            }
            
            if currentCount > maxCount {
                maxCount = currentCount
            }
        }
        
        return maxCount
    }
}
