class Solution {
    func minCost(_ maxTime: Int, _ edges: [[Int]], _ passingFees: [Int]) -> Int {
        let n = passingFees.count
        var graph = Array(repeating: [(Int, Int)](), count: n)
        for e in edges {
            graph[e[0]].append((e[1], e[2]))
            graph[e[1]].append((e[0], e[2]))
        }
        var times = Array(repeating: maxTime + 1, count: n)
        var costs = Array(repeating: Int.max, count: n)
        times[0] = 0
        costs[0] = passingFees[0]
        var pq = [(passingFees[0], 0, 0)]
        while !pq.isEmpty {
            // find min
            var minIdx = 0
            for i in 1..<pq.count {
                if pq[i].0 < pq[minIdx].0 || (pq[i].0 == pq[minIdx].0 && pq[i].1 < pq[minIdx].1) {
                    minIdx = i
                }
            }
            let cur = pq.remove(at: minIdx)
            let cost = cur.0, time = cur.1, city = cur.2
            if city == n - 1 { return cost }
            for (nxt, t) in graph[city] {
                let nt = time + t
                if nt > maxTime { continue }
                let nc = cost + passingFees[nxt]
                if nc < costs[nxt] || nt < times[nxt] {
                    costs[nxt] = nc
                    times[nxt] = nt
                    pq.append((nc, nt, nxt))
                }
            }
        }
        return -1
    }
}
