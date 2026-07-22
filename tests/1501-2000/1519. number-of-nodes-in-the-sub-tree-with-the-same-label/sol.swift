class Solution {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        var matrix = [[Int]](repeating: [], count: n)
        for edge in edges {
            let u = edge[0], v = edge[1]
            matrix[u].append(v)
            matrix[v].append(u)
        }

        var parent = [Int](repeating: -1, count: n)
        var order = [0]
        var idx = 0
        while idx < order.count {
            let node = order[idx]
            for child in matrix[node] {
                if child != parent[node] {
                    parent[child] = node
                    order.append(child)
                }
            }
            idx += 1
        }

        var counts = [[Int]](repeating: [Int](repeating: 0, count: 26), count: n)
        var ans = [Int](repeating: 0, count: n)
        let labelChars = Array(labels)
        for node in order.reversed() {
            let label = Int(labelChars[node].asciiValue! - 97)
            counts[node][label] += 1
            ans[node] = counts[node][label]
            if parent[node] != -1 {
                for i in 0..<26 {
                    counts[parent[node]][i] += counts[node][i]
                }
            }
        }
        return ans
    }
}
