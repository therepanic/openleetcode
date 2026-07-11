class Solution {
    func isEscapePossible(_ blocked: [[Int]], _ source: [Int], _ target: [Int]) -> Bool {
        let blockedSet = Set(blocked.map { [$0[0], $0[1]] })
        let MAX = blocked.count * blocked.count / 2
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        func bfs(_ start: [Int], _ end: [Int]) -> Bool {
            var visited = Set<[Int]>()
            var queue = [start]
            visited.insert(start)
            var count = 0

            while !queue.isEmpty {
                let cur = queue.removeFirst()
                let x = cur[0], y = cur[1]
                if x == end[0] && y == end[1] { return true }
                if count > MAX { return true }

                for (dx, dy) in dirs {
                    let nx = x + dx
                    let ny = y + dy
                    let key = [nx, ny]
                    if nx >= 0 && nx < 1_000_000 && ny >= 0 && ny < 1_000_000 && !visited.contains(key) && !blockedSet.contains(key) {
                        visited.insert(key)
                        queue.append(key)
                    }
                }
                count += 1
            }
            return false
        }

        return bfs(source, target) && bfs(target, source)
    }
}
