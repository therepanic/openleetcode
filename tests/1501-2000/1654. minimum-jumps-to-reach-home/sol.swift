class Solution {
    func minimumJumps(_ forbidden: [Int], _ a: Int, _ b: Int, _ x: Int) -> Int {
        var idx = 1
        let m = min(a, b)
        if m >= 2 {
            for i in 2...m {
                if a % i == 0 && b % i == 0 {
                    idx = i
                }
            }
        }
        if x % idx != 0 { return -1 }
        var queue: [(Int, Int, Int)] = [(0, 1, 0)]
        var visited = Set<Int>()
        visited.insert(0)
        for f in forbidden { visited.insert(f) }
        let top = forbidden.max() ?? 0
        let limit = top + x + a + b
        var qIndex = 0
        while qIndex < queue.count {
            let (curr, prev, step) = queue[qIndex]
            qIndex += 1
            if curr == x { return step }
            if prev == 1 {
                let nb = curr - b
                if nb >= 0 && !visited.contains(nb) {
                    visited.insert(nb)
                    queue.append((nb, -1, step + 1))
                }
            }
            let na = curr + a
            if na <= limit && !visited.contains(na) {
                visited.insert(na)
                queue.append((na, 1, step + 1))
            }
        }
        return -1
    }
}
