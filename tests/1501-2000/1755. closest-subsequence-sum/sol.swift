class Solution {
    func minAbsDifference(_ nums: [Int], _ goal: Int) -> Int {
        func sums(_ values: [Int]) -> [Int] {
            var result = [0]
            for value in values {
                let currentCount = result.count
                for i in 0..<currentCount {
                    result.append(result[i] + value)
                }
            }
            return result
        }
        let mid = nums.count / 2
        var left = sums(Array(nums[0..<mid])).sorted()
        var right = sums(Array(nums[mid..<nums.count])).sorted()
        var answer = abs(goal)
        var j = right.count - 1
        for value in left {
            while j > 0 && right[j - 1] >= goal - value {
                j -= 1
            }
            answer = min(answer, abs(value + right[j] - goal))
            if j > 0 {
                answer = min(answer, abs(value + right[j - 1] - goal))
            }
        }
        return answer
    }
}
