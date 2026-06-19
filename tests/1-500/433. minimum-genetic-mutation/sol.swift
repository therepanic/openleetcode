class Solution {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        let s = Set(bank)
        if !s.contains(endGene) && startGene != endGene { return -1 }
        var q: [(String, Int)] = [(startGene, 0)]
        var v: Set<String> = [startGene]
        let choices: [Character] = ["A", "C", "G", "T"]
        while !q.isEmpty {
            let (g, d) = q.removeFirst()
            if g == endGene { return d }
            for i in 0..<8 {
                for c in choices {
                    if g[g.index(g.startIndex, offsetBy: i)] != c {
                        var n = g
                        let idx = g.index(g.startIndex, offsetBy: i)
                        n.replaceSubrange(idx...idx, with: String(c))
                        if s.contains(n) && !v.contains(n) {
                            v.insert(n)
                            q.append((n, d+1))
                        }
                    }
                }
            }
        }
        return -1
    }
}
