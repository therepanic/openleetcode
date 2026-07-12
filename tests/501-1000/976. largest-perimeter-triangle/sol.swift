class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        var nums = nums
        let minVal = nums.min()!
        let maxVal = nums.max()!

        var freq = [Int](repeating: 0, count: maxVal - minVal + 1)
        for x in nums {
            freq[x - minVal] += 1
        }

        var idx = 0
        for v in stride(from: maxVal, through: minVal, by: -1) {
            while freq[v - minVal] > 0 {
                nums[idx] = v
                idx += 1
                freq[v - minVal] -= 1
            }
        }

        for i in 0..<nums.count - 2 {
            if nums[i + 1] + nums[i + 2] > nums[i] {
                return nums[i] + nums[i + 1] + nums[i + 2]
            }
        }
        return 0
    }
}
