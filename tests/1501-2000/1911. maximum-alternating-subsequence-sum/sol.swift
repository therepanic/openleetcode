class Solution {

    func maxAlternatingSum(_ nums: [Int]) -> Int {

        let n = nums.count

        var memo = [[Int]](repeating: [Int](repeating: -1, count: 2), count: n+1)

        func solve(_ idx: Int, _ flag: Int) -> Int {

            if idx >= n {

                return 0

            }

            if memo[idx][flag] != -1 {

                return memo[idx][flag]

            }

            let skip = solve(idx+1, flag)

            var val = nums[idx]

            if flag == 0 {

                val = -val

            }

            let take = val + solve(idx+1, 1 - flag)

            memo[idx][flag] = max(skip, take)

            return memo[idx][flag]

        }

        return solve(0, 1)

    }

}
