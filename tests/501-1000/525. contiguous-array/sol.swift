class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var count = 0
        var maxLength = 0
        var countMap = [0: -1]

        for i in 0..<nums.count {
            if nums[i] == 0 {
                count -= 1
            } else {
                count += 1
            }

            if let prevIndex = countMap[count] {
                maxLength = max(maxLength, i - prevIndex)
            } else {
                countMap[count] = i
            }
        }

        return maxLength
    }
}
