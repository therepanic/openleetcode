class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var sumBits = 0
        var maxNum = 0
        for num in nums {
            sumBits += num.nonzeroBitCount
            if num > maxNum {
                maxNum = num
            }
        }
        let doubling = maxNum > 0 ? String(maxNum, radix: 2).count - 1 : 0
        return sumBits + doubling
    }
}
