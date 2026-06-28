class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        var start = nums.count
        var end = 0

        for i in 0..<nums.count {
            if nums[i] != sortedNums[i] {
                start = min(start, i)
                end = max(end, i)
            }
        }

        return end - start >= 0 ? end - start + 1 : 0
    }
}
