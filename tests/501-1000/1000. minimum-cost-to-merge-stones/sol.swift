class Solution {
    func mergeStones(_ stones: [Int], _ k: Int) -> Int {
        let n = stones.count
        if n == 0 {
            return 0
        }
        if k <= 1 {
            return n == 1 ? 0 : -1
        }
        if (n - 1) % (k - 1) != 0 {
            return -1
        }

        var prefix = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            prefix[i + 1] = prefix[i] + stones[i]
        }

        let inf = Int.max / 4
        var memo = [String: Int]()

        func key(_ i: Int, _ j: Int, _ p: Int) -> String {
            return "\(i)#\(j)#\(p)"
        }

        func dfs(_ i: Int, _ j: Int, _ p: Int) -> Int {
            let cacheKey = key(i, j, p)
            if let cached = memo[cacheKey] {
                return cached
            }

            let result: Int
            if i == j {
                result = (p == 1) ? 0 : inf
            } else if p == 1 {
                let merged = dfs(i, j, k)
                result = merged >= inf ? inf : merged + prefix[j + 1] - prefix[i]
            } else {
                var best = inf
                var m = i
                while m < j {
                    let left = dfs(i, m, 1)
                    if left < best {
                        let right = dfs(m + 1, j, p - 1)
                        if right < inf {
                            best = min(best, left + right)
                        }
                    }
                    m += k - 1
                }
                result = best
            }

            memo[cacheKey] = result
            return result
        }

        let answer = dfs(0, n - 1, 1)
        return answer >= inf ? -1 : answer
    }
}
