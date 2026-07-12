class Solution {
    func loudAndRich(_ richer: [[Int]], _ quiet: [Int]) -> [Int] {
        let n = quiet.count
        var graph = [[Int]](repeating: [], count: n)
        for pair in richer {
            graph[pair[1]].append(pair[0])
        }
        
        var answer = [Int](repeating: -1, count: n)
        
        func dfs(_ i: Int) -> Int {
            if answer[i] != -1 {
                return answer[i]
            }
            answer[i] = i
            for nei in graph[i] {
                let item = dfs(nei)
                if quiet[item] < quiet[answer[i]] {
                    answer[i] = item
                }
            }
            return answer[i]
        }
        
        for i in 0..<n {
            _ = dfs(i)
        }
        return answer
    }
}
