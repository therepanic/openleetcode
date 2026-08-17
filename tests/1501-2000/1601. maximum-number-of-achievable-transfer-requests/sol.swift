class Solution {
    var ans = 0
    
    func maximumRequests(_ n: Int, _ requests: [[Int]]) -> Int {
        var indegree = [Int](repeating: 0, count: n)
        helper(0, requests, &indegree, n, 0)
        return ans
    }
    
    private func helper(_ start: Int, _ requests: [[Int]], _ indegree: inout [Int], _ n: Int, _ count: Int) {
        if start == requests.count {
            for i in 0..<n {
                if indegree[i] != 0 { return }
            }
            ans = max(ans, count)
            return
        }
        
        // Take
        indegree[requests[start][0]] -= 1
        indegree[requests[start][1]] += 1
        helper(start + 1, requests, &indegree, n, count + 1)
        
        // Not-take
        indegree[requests[start][0]] += 1
        indegree[requests[start][1]] -= 1
        helper(start + 1, requests, &indegree, n, count)
    }
}
