class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        var dp = [Int: Set<Int>]()
        for stone in stones {
            dp[stone] = Set()
        }
        dp[0] = [0]

        for stone in stones {
            for jump in dp[stone]! {
                for jumpDistance in [jump - 1, jump, jump + 1] {
                    if jumpDistance > 0, let _ = dp[stone + jumpDistance] {
                        dp[stone + jumpDistance]!.insert(jumpDistance)
                    }
                }
            }
        }

        return !dp[stones.last!]!.isEmpty
    }
}
