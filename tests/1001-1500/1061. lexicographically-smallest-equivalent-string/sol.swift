class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        var adj = [Character: [Character]]()
        for (a, b) in zip(s1, s2) {
            adj[a, default: []].append(b)
            adj[b, default: []].append(a)
        }

        func dfs(_ ch: Character, _ visited: inout Set<Character>) -> Character {
            visited.insert(ch)
            var minCh = ch
            for nei in adj[ch] ?? [] {
                if !visited.contains(nei) {
                    let candidate = dfs(nei, &visited)
                    if candidate < minCh {
                        minCh = candidate
                    }
                }
            }
            return minCh
        }

        var result = ""
        for ch in baseStr {
            var visited = Set<Character>()
            result.append(dfs(ch, &visited))
        }
        return result
    }
}
