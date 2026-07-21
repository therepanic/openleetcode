class Solution {
    func minFlips(_ mat: [[Int]]) -> Int {
        let m = mat.count
        let n = mat[0].count
        var masks = [Int]()
        masks.reserveCapacity(m * n)
        let dirs = [(0, 0), (1, 0), (-1, 0), (0, 1), (0, -1)]

        for r in 0..<m {
            for c in 0..<n {
                var mask = 0
                for (dr, dc) in dirs {
                    let nr = r + dr
                    let nc = c + dc
                    if nr >= 0 && nr < m && nc >= 0 && nc < n {
                        mask |= 1 << (nr * n + nc)
                    }
                }
                masks.append(mask)
            }
        }

        var start = 0
        for r in 0..<m {
            for c in 0..<n {
                if mat[r][c] == 1 {
                    start |= 1 << (r * n + c)
                }
            }
        }

        let size = 1 << (m * n)
        var dist = Array(repeating: -1, count: size)
        var q = [start]
        dist[start] = 0

        var head = 0
        while head < q.count {
            let state = q[head]
            head += 1
            let steps = dist[state]
            if state == 0 {
                return steps
            }
            for mask in masks {
                let next = state ^ mask
                if dist[next] == -1 {
                    dist[next] = steps + 1
                    q.append(next)
                }
            }
        }

        return -1
    }
}
