class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0, maxLength = 0, zeroCount = 0
        for right in 0..<nums.count {
            if nums[right] == 0 {
                zeroCount += 1
            }
            while zeroCount > k {
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            maxLength = max(maxLength, right - left + 1)
        }
        return maxLength
    }
}
