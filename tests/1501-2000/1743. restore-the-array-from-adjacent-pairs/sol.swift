class Solution {
    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        var xorMap: [Int: Int] = [:]
        var degree: [Int: Int] = [:]

        for pair in adjacentPairs {
            let u = pair[0], v = pair[1]
            xorMap[u] = (xorMap[u] ?? 0) ^ v
            xorMap[v] = (xorMap[v] ?? 0) ^ u
            degree[u] = (degree[u] ?? 0) + 1
            degree[v] = (degree[v] ?? 0) + 1
        }

        var start = 0
        for (key, value) in degree {
            if value == 1 {
                start = key
                break
            }
        }

        let n = adjacentPairs.count + 1
        var res = [Int](repeating: 0, count: n)

        res[0] = start
        var prev = 0

        for i in 1..<n {
            res[i] = (xorMap[res[i - 1]] ?? 0) ^ prev
            prev = res[i - 1]
        }

        return res
    }
}
