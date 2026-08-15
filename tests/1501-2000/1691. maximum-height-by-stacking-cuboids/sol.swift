class Solution {
    func maxHeight(_ cuboids: [[Int]]) -> Int {
        var cubs = cuboids
        for i in 0..<cubs.count {
            cubs[i].sort()
        }
        cubs.sort { 
            if $0[0] != $1[0] { return $0[0] < $1[0] }
            if $0[1] != $1[1] { return $0[1] < $1[1] }
            return $0[2] < $1[2]
        }
        let n = cubs.count
        var dp = [Int](repeating: 0, count: n)
        var ans = 0
        for i in 0..<n {
            dp[i] = cubs[i][2]
            for j in 0..<i {
                if cubs[j][0] <= cubs[i][0] && cubs[j][1] <= cubs[i][1] && cubs[j][2] <= cubs[i][2] {
                    dp[i] = max(dp[i], dp[j] + cubs[i][2])
                }
            }
            ans = max(ans, dp[i])
        }
        return ans
    }
}
