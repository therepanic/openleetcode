class Solution {
    func maxGeneticDifference(_ parents: [Int], _ queries: [[Int]]) -> [Int] {
        class TrieNode {
            var count: Int = 0
            var child: [Int: TrieNode] = [:]
        }

        class BitTrie {
            var root = TrieNode()

            func increase(_ number: Int, _ d: Int) {
                var cur = root
                for i in stride(from: 17, through: 0, by: -1) {
                    let bit = (number >> i) & 1
                    if cur.child[bit] == nil {
                        cur.child[bit] = TrieNode()
                    }
                    cur = cur.child[bit]!
                    cur.count += d
                }
            }

            func findMax(_ number: Int) -> Int {
                var cur = root
                var ans = 0
                for i in stride(from: 17, through: 0, by: -1) {
                    let bit = (number >> i) & 1
                    let desired = 1 - bit
                    if let nxt = cur.child[desired], nxt.count > 0 {
                        cur = nxt
                        ans |= (1 << i)
                    } else {
                        cur = cur.child[bit]!
                    }
                }
                return ans
            }
        }

        let n = parents.count
        var adj = Array(repeating: [Int](), count: n)
        var root = 0
        for i in 0..<n {
            if parents[i] == -1 {
                root = i
            } else {
                adj[parents[i]].append(i)
            }
        }

        let trie = BitTrie()
        var qmap: [Int: [(Int, Int)]] = [:]
        for (i, q) in queries.enumerated() {
            qmap[q[0], default: []].append((i, q[1]))
        }

        var ans = Array(repeating: 0, count: queries.count)

        func dfs(_ u: Int) {
            trie.increase(u, 1)
            if let list = qmap[u] {
                for (idx, val) in list {
                    ans[idx] = trie.findMax(val)
                }
            }
            for v in adj[u] {
                dfs(v)
            }
            trie.increase(u, -1)
        }

        dfs(root)
        return ans
    }
}
