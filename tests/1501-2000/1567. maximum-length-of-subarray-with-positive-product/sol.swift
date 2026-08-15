class Solution {
    func getMaxLen(_ nums: [Int]) -> Int {
        var posLen = 0, negLen = 0, maxLen = 0
        for num in nums {
            if num == 0 {
                posLen = 0
                negLen = 0
            } else if num > 0 {
                posLen += 1
                negLen = negLen > 0 ? negLen + 1 : 0
            } else {
                let temp = posLen
                posLen = negLen > 0 ? negLen + 1 : 0
                negLen = temp + 1
            }
            maxLen = max(maxLen, posLen)
        }
        return maxLen
    }
}
