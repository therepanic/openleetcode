class Solution {
    func stoneGameV(_ stoneValue: [Int]) -> Int {
        let n = stoneValue.count
        var sv = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            sv[i + 1] = sv[i] + stoneValue[i]
        }
        var memo = [[Int]](repeating: [Int](repeating: -1, count: n + 1), count: n + 1)
        return helper(sv, 0, n, &memo)
    }
    
    private func helper(_ sv: [Int], _ fro: Int, _ to: Int, _ memo: inout [[Int]]) -> Int {
        if to - fro == 1 { return 0 }
        if memo[fro][to] != -1 { return memo[fro][to] }
        
        let target = (sv[to] + sv[fro]) / 2
        var lo = fro, hi = to
        while lo < hi {
            let mid = (lo + hi) / 2
            if sv[mid] < target { lo = mid + 1 } else { hi = mid }
        }
        let pivot = lo
        
        var dist = 0
        var res = 0
        var exploreMore = true
        let maxDist = max(pivot - fro, to - pivot)
        while exploreMore && dist <= maxDist {
            exploreMore = false
            for i in [pivot - dist, pivot + dist] {
                if fro < i && i <= to {
                    let left = sv[i] - sv[fro]
                    let right = sv[to] - sv[i]
                    if res / 2 <= left && left <= right {
                        res = max(res, left + helper(sv, fro, i, &memo))
                        exploreMore = true
                    }
                    if left >= right && right >= res / 2 {
                        res = max(res, right + helper(sv, i, to, &memo))
                        exploreMore = true
                    }
                }
            }
            dist += 1
        }
        memo[fro][to] = res
        return res
    }
}
