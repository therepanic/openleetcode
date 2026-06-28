class Solution {
    func fallingSquares(_ positions: [[Int]]) -> [Int] {
        var ans = [Int]()
        var posSet = Set<Int>()
        for p in positions {
            let l = p[0], side = p[1]
            posSet.insert(l)
            posSet.insert(l + side - 1)
        }
        let pos = posSet.sorted()
        var mp = [Int: Int]()
        for (i, v) in pos.enumerated() {
            mp[v] = i
        }
        let n = pos.count
        var tree = Array(repeating: 0, count: 4 * n)
        var lazy = Array(repeating: 0, count: 4 * n)
        let arr = Array(repeating: 0, count: n)

        func buildTree(_ node: Int, _ start: Int, _ end: Int) {
            if start == end {
                tree[node] = arr[start]
                return
            }
            let mid = (start + end) / 2
            buildTree(node * 2 + 1, start, mid)
            buildTree(node * 2 + 2, mid + 1, end)
            tree[node] = max(tree[node * 2 + 1], tree[node * 2 + 2])
        }

        func updateHelper(_ node: Int, _ start: Int, _ end: Int, _ left: Int, _ right: Int, _ val: Int) {
            if lazy[node] != 0 {
                tree[node] = max(tree[node], lazy[node])
                if start != end {
                    lazy[node * 2 + 1] = lazy[node]
                    lazy[node * 2 + 2] = lazy[node]
                }
                lazy[node] = 0
            }

            if start > right || end < left || start > end {
                return
            }

            if start >= left && end <= right {
                tree[node] = val
                if start != end {
                    lazy[node * 2 + 1] = val
                    lazy[node * 2 + 2] = val
                }
                return
            }

            let mid = (start + end) / 2
            updateHelper(node * 2 + 1, start, mid, left, right, val)
            updateHelper(node * 2 + 2, mid + 1, end, left, right, val)
            tree[node] = max(tree[node * 2 + 1], tree[node * 2 + 2])
        }

        func queryHelper(_ node: Int, _ start: Int, _ end: Int, _ left: Int, _ right: Int) -> Int {
            if lazy[node] != 0 {
                tree[node] = max(tree[node], lazy[node])
                if start != end {
                    lazy[node * 2 + 1] = lazy[node]
                    lazy[node * 2 + 2] = lazy[node]
                }
                lazy[node] = 0
            }

            if start >= left && end <= right {
                return tree[node]
            }

            if start > right || end < left {
                return 0
            }

            let mid = (start + end) / 2
            return max(
                queryHelper(node * 2 + 1, start, mid, left, right),
                queryHelper(node * 2 + 2, mid + 1, end, left, right)
            )
        }

        func updateRange(_ left: Int, _ right: Int, _ val: Int) {
            updateHelper(0, 0, n - 1, left, right, val)
        }

        func query(_ left: Int, _ right: Int) -> Int {
            return queryHelper(0, 0, n - 1, left, right)
        }

        if n > 0 {
            buildTree(0, 0, n - 1)
        }

        for p in positions {
            let l = p[0], side = p[1]
            let left = mp[l]!
            let right = mp[l + side - 1]!
            let mx = query(left, right)
            updateRange(left, right, mx + side)
            ans.append(query(0, n - 1))
        }
        return ans
    }
}
