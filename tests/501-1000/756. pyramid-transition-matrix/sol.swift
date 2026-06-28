class Solution {
    func pyramidTransition(_ bottom: String, _ allowed: [String]) -> Bool {
        var tab: [String: Set<Character>] = [:]
        for a in allowed {
            let key = String([a[a.startIndex], a[a.index(after: a.startIndex)]])
            tab[key, default: []].insert(a.last!)
        }
        
        var visited: Set<String> = []
        
        func addNeighbor(_ node: String) -> [String] {
            var res = [""]
            let chars = Array(node)
            for i in 1..<chars.count {
                let key = String([chars[i-1], chars[i]])
                guard let set = tab[key], !set.isEmpty else { return [] }
                res = res.flatMap { r in set.map { c in r + String(c) } }
            }
            return res
        }
        
        func dfs(_ node: String) -> Bool {
            if node.count == 1 { return true }
            if visited.contains(node) { return false }
            
            for nxt in addNeighbor(node) {
                if dfs(nxt) { return true }
            }
            
            visited.insert(node)
            return false
        }
        
        return dfs(bottom)
    }
}
