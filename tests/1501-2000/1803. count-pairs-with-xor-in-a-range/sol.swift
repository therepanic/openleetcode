class Solution {
    func countPairs(_ nums: [Int], _ low: Int, _ high: Int) -> Int {
        let maxVal = nums.max() ?? 0
        let bits = max(1, max(String(maxVal, radix: 2).count, String(high + 1, radix: 2).count))

        func countLess(_ bound: Int) -> Int {
            if bound <= 0 { return 0 }
            var child = [[-1, -1]]
            var counts = [0]
            var total = 0
            for value in nums {
                var node = 0
                for bit in stride(from: bits - 1, through: 0, by: -1) {
                    let v = (value >> bit) & 1
                    let b = (bound >> bit) & 1
                    if b == 1 {
                        let same = child[node][v]
                        if same != -1 { total += counts[same] }
                        let nxt = child[node][1 - v]
                        if nxt == -1 { node = -1; break }
                        node = nxt
                    } else {
                        let nxt = child[node][v]
                        if nxt == -1 { node = -1; break }
                        node = nxt
                    }
                }
                node = 0
                for bit in stride(from: bits - 1, through: 0, by: -1) {
                    let v = (value >> bit) & 1
                    let nxt = child[node][v]
                    if nxt == -1 {
                        let newIdx = child.count
                        child[node][v] = newIdx
                        child.append([-1, -1])
                        counts.append(0)
                    }
                    node = child[node][v]
                    counts[node] += 1
                }
            }
            return total
        }

        return countLess(high + 1) - countLess(low)
    }
}
