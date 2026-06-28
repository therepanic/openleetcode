class Solution {
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        if trees.count == 1 {
            return trees
        }

        func cross(_ o: [Int], _ a: [Int], _ b: [Int]) -> Int {
            return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
        }

        let trees = trees.sorted { a, b in
            a[0] == b[0] ? a[1] < b[1] : a[0] < b[0]
        }

        var lower = [[Int]]()
        for p in trees {
            while lower.count >= 2 && cross(lower[lower.count - 2], lower[lower.count - 1], p) < 0 {
                lower.removeLast()
            }
            lower.append(p)
        }

        var upper = [[Int]]()
        for p in trees.reversed() {
            while upper.count >= 2 && cross(upper[upper.count - 2], upper[upper.count - 1], p) < 0 {
                upper.removeLast()
            }
            upper.append(p)
        }

        lower.removeLast()
        upper.removeLast()
        var fullHull = lower + upper

        var seen = Set<String>()
        var result = [[Int]]()
        for p in fullHull {
            let key = "\(p[0]),\(p[1])"
            if !seen.contains(key) {
                seen.insert(key)
                result.append(p)
            }
        }
        return result
    }
}
