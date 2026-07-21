class Solution {
    func minCost(_ houses: [Int], _ cost: [[Int]], _ m: Int, _ n: Int, _ target: Int) -> Int {
        let INF = 1000000000
        var prev = Array(repeating: Array(repeating: INF, count: target + 1), count: n)
        if houses[0] != 0 {
            let c = houses[0] - 1
            prev[c][1] = 0
        } else {
            for c in 0..<n {
                prev[c][1] = cost[0][c]
            }
        }
        for i in 1..<m {
            var curr = Array(repeating: Array(repeating: INF, count: target + 1), count: n)
            if houses[i] != 0 {
                let c = houses[i] - 1
                let add = 0
                for k in 1...target {
                    if prev[c][k] < INF {
                        if prev[c][k] + add < curr[c][k] {
                            curr[c][k] = prev[c][k] + add
                        }
                    }
                    if k > 1 {
                        var best = INF
                        for pc in 0..<n {
                            if pc != c && prev[pc][k - 1] < best {
                                best = prev[pc][k - 1]
                            }
                        }
                        if best < INF && best + add < curr[c][k] {
                            curr[c][k] = best + add
                        }
                    }
                }
            } else {
                for c in 0..<n {
                    let add = cost[i][c]
                    for k in 1...target {
                        if prev[c][k] < INF {
                            if prev[c][k] + add < curr[c][k] {
                                curr[c][k] = prev[c][k] + add
                            }
                        }
                        if k > 1 {
                            var best = INF
                            for pc in 0..<n {
                                if pc != c && prev[pc][k - 1] < best {
                                    best = prev[pc][k - 1]
                                }
                            }
                            if best < INF && best + add < curr[c][k] {
                                curr[c][k] = best + add
                            }
                        }
                    }
                }
            }
            prev = curr
        }
        var ans = INF
        for c in 0..<n {
            if prev[c][target] < ans {
                ans = prev[c][target]
            }
        }
        return ans >= INF ? -1 : ans
    }
}
