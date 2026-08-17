class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        let length = nums.count
        var minOps = length
        let uniqueNums = Array(Set(nums)).sorted()
        var right = 0
        
        for left in 0..<uniqueNums.count {
            while right < uniqueNums.count && uniqueNums[right] < uniqueNums[left] + length {
                right += 1
            }
            
            minOps = min(minOps, length - (right - left))
        }
        
        return minOps
    }
}
