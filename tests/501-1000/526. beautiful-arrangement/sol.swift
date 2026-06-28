class Solution {
    func countArrangement(_ n: Int) -> Int {
        var visited = [Bool](repeating: false, count: n + 1)
        
        func backtrack(_ index: Int) -> Int {
            if index > n {
                return 1
            }
            var count = 0
            for i in 1...n {
                if !visited[i] && (i % index == 0 || index % i == 0) {
                    visited[i] = true
                    count += backtrack(index + 1)
                    visited[i] = false
                }
            }
            return count
        }
        
        return backtrack(1)
    }
}
