class Solution {
    func earliestAndLatest(_ n: Int, _ firstPlayer: Int, _ secondPlayer: Int) -> [Int] {
        return dfs(n, firstPlayer, secondPlayer)
    }
    
    private func dfs(_ n: Int, _ p1: Int, _ p2: Int) -> [Int] {
        if p1 + p2 == n + 1 { return [1, 1] }
        var p1 = p1
        var p2 = p2
        if p1 > p2 { swap(&p1, &p2) }
        if n <= 4 { return [2, 2] }
        
        let m = (n + 1) / 2
        var minR = Int.max
        var maxR = Int.min
        
        if p1 - 1 > n - p2 {
            let t = n + 1 - p1
            p1 = n + 1 - p2
            p2 = t
        }
        
        if p2 * 2 <= n + 1 {
            let a = p1 - 1
            let b = p2 - p1 - 1
            for i in 0...a {
                for j in 0...b {
                    let r = dfs(m, i + 1, i + j + 2)
                    minR = min(minR, r[0] + 1)
                    maxR = max(maxR, r[1] + 1)
                }
            }
        } else {
            let p4 = n + 1 - p2
            let a = p1 - 1
            let b = p4 - p1 - 1
            let c = p2 - p4 - 1
            for i in 0...a {
                for j in 0...b {
                    let offset = i + j + 1 + (c + 1) / 2 + 1
                    let r = dfs(m, i + 1, offset)
                    minR = min(minR, r[0] + 1)
                    maxR = max(maxR, r[1] + 1)
                }
            }
        }
        
        return [minR, maxR]
    }
}
