class Solution {
    private func checkSimilarity(_ str1: String, _ str2: String) -> Bool {
        var diff = 0
        let arr1 = Array(str1)
        let arr2 = Array(str2)
        for i in 0..<arr1.count {
            if arr1[i] != arr2[i] {
                diff += 1
            }
        }
        return diff == 0 || diff == 2
    }
    
    private func dfs(_ node: Int, _ matrix: [[Int]], _ visited: inout Set<Int>) {
        if visited.contains(node) {
            return
        }
        visited.insert(node)
        for nei in matrix[node] {
            if !visited.contains(nei) {
                dfs(nei, matrix, &visited)
            }
        }
    }
    
    func numSimilarGroups(_ strs: [String]) -> Int {
        let n = strs.count
        var matrix = [[Int]](repeating: [], count: n)
        
        for i in 0..<n {
            for j in 0..<n {
                if checkSimilarity(strs[i], strs[j]) {
                    matrix[i].append(j)
                    matrix[j].append(i)
                }
            }
        }
        
        var count = 0
        var visited = Set<Int>()
        for start in 0..<n {
            if !visited.contains(start) {
                dfs(start, matrix, &visited)
                count += 1
            }
        }
        
        return count
    }
}
