class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Float], _ queries: [[String]]) -> [Double] {
        var g = [String: [String: Double]]()
        for i in 0..<equations.count {
            let a = equations[i][0]
            let b = equations[i][1]
            let v = Double(values[i])
            g[a, default: [:]][b] = v
            g[b, default: [:]][a] = 1.0 / v
        }
        
        func dfs(_ x: String, _ y: String) -> Double {
            if g[x] == nil || g[y] == nil { return -1.0 }
            if x == y { return 1.0 }
            var stack = [(x, 1.0)]
            var visited = Set<String>()
            while !stack.isEmpty {
                let (c, r) = stack.removeLast()
                if c == y { return r }
                visited.insert(c)
                for (n, w) in g[c]! {
                    if !visited.contains(n) {
                        stack.append((n, r * w))
                    }
                }
            }
            return -1.0
        }
        
        return queries.map { dfs($0[0], $0[1]) }
    }
}
