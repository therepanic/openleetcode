class Solution {
    func equationsPossible(_ equations: [String]) -> Bool {
        var parent = Array(0..<26)
        var rank = Array(repeating: 0, count: 26)

        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }

        func union(_ a: Int, _ b: Int) {
            let ra = find(a)
            let rb = find(b)
            if ra == rb { return }
            if rank[ra] < rank[rb] {
                parent[ra] = rb
            } else if rank[ra] > rank[rb] {
                parent[rb] = ra
            } else {
                parent[rb] = ra
                rank[ra] += 1
            }
        }

        for eq in equations {
            let chars = Array(eq)
            if chars[1] == "=" {
                let a = Int(chars[0].asciiValue! - Character("a").asciiValue!)
                let b = Int(chars[3].asciiValue! - Character("a").asciiValue!)
                union(a, b)
            }
        }

        for eq in equations {
            let chars = Array(eq)
            if chars[1] == "!" {
                let a = Int(chars[0].asciiValue! - Character("a").asciiValue!)
                let b = Int(chars[3].asciiValue! - Character("a").asciiValue!)
                if find(a) == find(b) {
                    return false
                }
            }
        }
        return true
    }
}
