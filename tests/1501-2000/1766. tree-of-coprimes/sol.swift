class Solution {
    func getCoprimes(_ nums: [Int], _ edges: [[Int]]) -> [Int] {
        let n = nums.count
        var adj = [[Int]](repeating: [], count: n)
        for e in edges {
            adj[e[0]].append(e[1])
            adj[e[1]].append(e[0])
        }
        var ans = [Int](repeating: -1, count: n)
        var depth = [Int](repeating: 0, count: n)
        var ancestorByValue = [Int](repeating: -1, count: 51)
        
        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }
        
        func dfs(_ node: Int, _ prev: Int, _ dep: Int) {
            depth[node] = dep
            var best = Int.max
            var bestAnc = -1
            for i in 1...50 {
                if gcd(i, nums[node]) == 1 {
                    let anc = ancestorByValue[i]
                    if anc != -1 {
                        let diff = dep - depth[anc]
                        if diff < best {
                            best = diff
                            bestAnc = anc
                        }
                    }
                }
            }
            ans[node] = bestAnc
            let prevState = ancestorByValue[nums[node]]
            ancestorByValue[nums[node]] = node
            for v in adj[node] {
                if v != prev {
                    dfs(v, node, dep + 1)
                }
            }
            ancestorByValue[nums[node]] = prevState
        }
        
        dfs(0, 0, 0)
        return ans
    }
}
