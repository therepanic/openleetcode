class Solution {
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let n = grid.count, m = grid[0].count
        var q = [[0, 0, k, 0]]
        var visi = Set<String>()
        visi.insert("0,0,\(k)")
        let dirs = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        while !q.isEmpty {
            let cur = q.removeFirst()
            let r = cur[0]
            let c = cur[1]
            var kRem = cur[2]
            let d = cur[3]
            if r == n - 1 && c == m - 1 { return d }
            if grid[r][c] == 1 { kRem -= 1 }
            for (dr, dc) in dirs {
                let nr = r + dr, nc = c + dc
                if nr >= 0 && nr < n && nc >= 0 && nc < m {
                    let key = "\(nr),\(nc),\(kRem)"
                    if !visi.contains(key) && kRem >= 0 {
                        visi.insert(key)
                        q.append([nr, nc, kRem, d + 1])
                    }
                }
            }
        }
        return -1
    }
}
