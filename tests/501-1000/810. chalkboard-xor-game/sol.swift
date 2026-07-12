class Solution {
    func xorGame(_ nums: [Int]) -> Bool {
        var totalXor = 0
        for value in nums {
            totalXor ^= value
        }
        
        let isXorZero = (totalXor == 0)
        let hasEvenLength = (nums.count % 2 == 0)
        
        return isXorZero || hasEvenLength
    }
}
