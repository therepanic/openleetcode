class Solution {
    func maximizeXor(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var trie: [[Int]] = [[-1, -1]]
        func insert(_ num: Int) {
            var node = 0
            for i in stride(from: 31, through: 0, by: -1) {
                let bit = (num >> i) & 1
                if trie[node][bit] == -1 {
                    trie[node][bit] = trie.count
                    trie.append([-1, -1])
                }
                node = trie[node][bit]
            }
        }
        func maxor(_ num: Int) -> Int {
            if trie[0][0] == -1 && trie[0][1] == -1 { return -1 }
            var node = 0
            var ans = 0
            for i in stride(from: 31, through: 0, by: -1) {
                let bit = (num >> i) & 1
                let opp = 1 - bit
                if trie[node][opp] != -1 {
                    ans |= (1 << i)
                    node = trie[node][opp]
                } else {
                    node = trie[node][bit]
                }
            }
            return ans
        }

        var numsSorted = nums.sorted()
        var q: [(m: Int, x: Int, i: Int)] = []
        for (i, qv) in queries.enumerated() {
            q.append((qv[1], qv[0], i))
        }
        q.sort { $0.m < $1.m }
        var res = [Int](repeating: -1, count: queries.count)
        var idx = 0
        let n = numsSorted.count
        for item in q {
            while idx < n && numsSorted[idx] <= item.m {
                insert(numsSorted[idx])
                idx += 1
            }
            res[item.i] = maxor(item.x)
        }
        return res
    }
}
