class Solution {
    var n: Int = 0
    var k: Int = 0
    var graph: [[Int]] = []
    var memo: [String: Int] = [:]
    
    func minNumberOfSemesters(_ n: Int, _ relations: [[Int]], _ k: Int) -> Int {
        self.n = n
        self.k = k
        graph = Array(repeating: [], count: n)
        var inDegrees = Array(repeating: 0, count: n)
        for rel in relations {
            let prev = rel[0] - 1
            let next = rel[1] - 1
            inDegrees[next] += 1
            graph[prev].append(next)
        }
        memo = [:]
        return recurse((1 << n) - 1, inDegrees)
    }
    
    func recurse(_ mask: Int, _ inDegrees: [Int]) -> Int {
        if mask == 0 { return 0 }
        let key = "\(mask)-\(inDegrees)"
        if let val = memo[key] { return val }
        
        var nodes: [Int] = []
        for i in 0..<n {
            if (mask & (1 << i)) != 0 && inDegrees[i] == 0 {
                nodes.append(i)
            }
        }
        var ans = Int.max
        let combLimit = min(k, nodes.count)
        let combos = combinations(nodes, combLimit)
        for kNodes in combos {
            var newMask = mask
            var newInDeg = inDegrees
            for node in kNodes {
                newMask ^= (1 << node)
                for child in graph[node] {
                    newInDeg[child] -= 1
                }
            }
            ans = min(ans, 1 + recurse(newMask, newInDeg))
        }
        memo[key] = ans
        return ans
    }
    
    func combinations(_ arr: [Int], _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        func helper(_ start: Int, _ current: inout [Int]) {
            if current.count == k {
                result.append(current)
                return
            }
            if start >= arr.count { return }
            for i in start..<arr.count {
                current.append(arr[i])
                helper(i + 1, &current)
                current.removeLast()
            }
        }
        var current: [Int] = []
        helper(0, &current)
        return result
    }
}
