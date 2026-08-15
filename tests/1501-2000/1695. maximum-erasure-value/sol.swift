class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var res = 0
        var curSum = 0
        var start = 0
        let k = 10001
        var isPresent = [Bool](repeating: false, count: k)

        for end in 0..<nums.count {
            while isPresent[nums[end]] {
                isPresent[nums[start]] = false
                curSum -= nums[start]
                start += 1
            }

            isPresent[nums[end]] = true
            curSum += nums[end]

            res = max(res, curSum)
        }

        return res
    }
}
