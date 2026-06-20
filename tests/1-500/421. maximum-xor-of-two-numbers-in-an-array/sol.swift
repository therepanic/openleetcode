class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        var answer = 0
        var mask = 0

        for bit in stride(from: 30, through: 0, by: -1) {
            mask |= 1 << bit
            var prefixes = Set<Int>()
            prefixes.reserveCapacity(nums.count)

            for num in nums {
                prefixes.insert(num & mask)
            }

            let candidate = answer | (1 << bit)
            for prefix in prefixes {
                if prefixes.contains(prefix ^ candidate) {
                    answer = candidate
                    break
                }
            }
        }

        return answer
    }
}
