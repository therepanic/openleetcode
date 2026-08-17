class Solution {
    func longestCommonSubpath(_ n: Int, _ paths: [[Int]]) -> Int {
        var combined: [Int] = []
        var pathOrigin: [Int] = []
        for (i, p) in paths.enumerated() {
            for v in p {
                combined.append(v)
                pathOrigin.append(i)
            }
            combined.append(-(i+1))
            pathOrigin.append(i)
        }
        let N = combined.count
        let M = paths.count
        let S = combined
        let P = pathOrigin

        // rank compression
        var rank = [Int](repeating: 0, count: N)
        do {
            let temp = S.sorted()
            for i in 0..<N {
                rank[i] = temp.firstIndex(of: S[i])!
            }
        }

        var k = 1
        while k < N {
            var keys = [Int64](repeating: 0, count: N)
            for i in 0..<N {
                let first = rank[i]
                let second = (i+k < N) ? rank[i+k] + 1 : 0
                keys[i] = (Int64(first) << 32) | Int64(second)
            }
            let sortedKeys = keys.sorted()
            for i in 0..<N {
                rank[i] = sortedKeys.firstIndex(of: keys[i])!
            }
            if k >= N { break }
            k *= 2
        }

        var sa = [Int](repeating: 0, count: N)
        for i in 0..<N {
            sa[rank[i]] = i
        }

        var lcp = [Int](repeating: 0, count: N)
        let inv = rank
        var h = 0
        for i in 0..<N {
            if inv[i] > 0 {
                let j = sa[inv[i]-1]
                while i+h < N && j+h < N && S[i+h] == S[j+h] {
                    h += 1
                }
                lcp[inv[i]] = h
                if h > 0 { h -= 1 }
            }
        }

        var ans = 0
        var left = 0
        var count = [Int](repeating: 0, count: M)
        var distinct = 0
        var minQ: [Int] = []
        for right in 0..<N {
            let p = P[sa[right]]
            if p >= 0 {
                if count[p] == 0 { distinct += 1 }
                count[p] += 1
            }
            while !minQ.isEmpty && lcp[minQ.last!] >= lcp[right] {
                minQ.removeLast()
            }
            minQ.append(right)

            while distinct == M {
                while !minQ.isEmpty && minQ.first! <= left {
                    minQ.removeFirst()
                }
                if !minQ.isEmpty {
                    ans = max(ans, lcp[minQ.first!])
                }
                let out = P[sa[left]]
                if out >= 0 {
                    count[out] -= 1
                    if count[out] == 0 { distinct -= 1 }
                }
                left += 1
            }
        }
        return ans
    }
}
