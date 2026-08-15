class Solution {
    func smallestMissingValueSubtree(_ parents: [Int], _ nums: [Int]) -> [Int] {
        let n = parents.count
        var graph = [[Int]](repeating: [], count: n)
        var nodeOne = -1
        var root = -1
        
        for child in 0..<n {
            if parents[child] == -1 {
                root = child
            } else {
                graph[parents[child]].append(child)
            }
            if nums[child] == 1 {
                nodeOne = child
            }
        }
        
        var results = [Int](repeating: 1, count: n)
        if nodeOne == -1 {
            return results
        }
        
        var seen = [Bool](repeating: false, count: 100002)
        var current = nodeOne
        var missing = 1
        
        while current != -1 {
            markSeen(current, graph, &seen, nums)
            while missing < 100002 && seen[missing] {
                missing += 1
            }
            results[current] = missing
            current = parents[current]
        }
        
        return results
    }
    
    private func markSeen(_ node: Int, _ graph: [[Int]], _ seen: inout [Bool], _ nums: [Int]) {
        if !seen[nums[node]] {
            seen[nums[node]] = true
            for child in graph[node] {
                markSeen(child, graph, &seen, nums)
            }
        }
    }
}
