class Solution {
    func crackSafe(_ n: Int, _ k: Int) -> String {
        if n == 1 {
            return (0..<k).map { String($0) }.joined()
        }
        
        var adj: [String: [Int]] = [:]
        let startNode = String(repeating: "0", count: n - 1)
        var res = ""
        
        func visit(_ node: String) {
            if adj[node] == nil {
                adj[node] = []
                for i in stride(from: k - 1, through: 0, by: -1) {
                    adj[node]!.append(i)
                }
            }
            while !adj[node]!.isEmpty {
                let digit = adj[node]!.removeLast()
                let nextNode = String((node + String(digit)).dropFirst())
                visit(nextNode)
                res += String(digit)
            }
        }
        
        visit(startNode)
        return res + startNode
    }
}
