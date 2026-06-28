class Solution {
    private let eps = 1e-6

    func judgePoint24(_ cards: [Int]) -> Bool {
        let nums = cards.map { Double($0) }
        return dfs(nums)
    }

    private func dfs(_ nums: [Double]) -> Bool {
        if nums.count == 1 {
            return abs(nums[0] - 24.0) < eps
        }

        for i in 0..<nums.count {
            for j in 0..<nums.count {
                if i == j { continue }

                var nextNums = [Double]()
                for k in 0..<nums.count {
                    if k != i && k != j {
                        nextNums.append(nums[k])
                    }
                }

                let a = nums[i], b = nums[j]
                var candidates = [a + b, a - b, b - a, a * b]
                if abs(b) > eps { candidates.append(a / b) }
                if abs(a) > eps { candidates.append(b / a) }

                for val in candidates {
                    if dfs(nextNums + [val]) {
                        return true
                    }
                }
            }
        }
        return false
    }
}
