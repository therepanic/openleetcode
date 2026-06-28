class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }

        var lengths = [Int](repeating: 1, count: n)
        var counts = [Int](repeating: 1, count: n)

        for i in 0..<n {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    if lengths[j] + 1 > lengths[i] {
                        lengths[i] = lengths[j] + 1
                        counts[i] = counts[j]
                    } else if lengths[j] + 1 == lengths[i] {
                        counts[i] += counts[j]
                    }
                }
            }
        }

        let maxLength = lengths.max() ?? 0
        var result = 0
        for i in 0..<n {
            if lengths[i] == maxLength {
                result += counts[i]
            }
        }
        return result
    }
}
