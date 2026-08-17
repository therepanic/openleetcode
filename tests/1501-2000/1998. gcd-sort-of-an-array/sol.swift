class Solution {
    func gcdSort(_ nums: [Int]) -> Bool {
        class UnionFind {
            var parent: [Int]
            var size: [Int]
            init(_ n: Int) {
                parent = Array(0..<n)
                size = Array(repeating: 1, count: n)
            }
            func find(_ x: Int) -> Int {
                if parent[x] != x {
                    parent[x] = find(parent[x])
                }
                return parent[x]
            }
            func union(_ x: Int, _ y: Int) {
                let px = find(x)
                let py = find(y)
                if px != py {
                    if size[px] < size[py] {
                        parent[px] = py
                        size[py] += size[px]
                    } else {
                        parent[py] = px
                        size[px] += size[py]
                    }
                }
            }
            func connected(_ x: Int, _ y: Int) -> Bool {
                return find(x) == find(y)
            }
        }

        let maxVal = nums.max() ?? 0
        let uf = UnionFind(maxVal + 1)
        for num in nums {
            var n = num
            var i = 2
            while i * i <= n {
                if n % i == 0 {
                    uf.union(i, num)
                    while n % i == 0 {
                        n /= i
                    }
                }
                i += 1
            }
            if n > 1 {
                uf.union(n, num)
            }
        }
        let sorted = nums.sorted()
        for i in 0..<nums.count {
            if !uf.connected(nums[i], sorted[i]) {
                return false
            }
        }
        return true
    }
}
