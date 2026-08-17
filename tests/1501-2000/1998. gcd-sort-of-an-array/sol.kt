class Solution {
    fun gcdSort(nums: IntArray): Boolean {
        class UnionFind(val n: Int) {
            val parent = IntArray(n) { it }
            val size = IntArray(n) { 1 }
            fun find(x: Int): Int {
                if (parent[x] != x) {
                    parent[x] = find(parent[x])
                }
                return parent[x]
            }
            fun union(x: Int, y: Int) {
                val px = find(x)
                val py = find(y)
                if (px != py) {
                    if (size[px] < size[py]) {
                        parent[px] = py
                        size[py] += size[px]
                    } else {
                        parent[py] = px
                        size[px] += size[py]
                    }
                }
            }
            fun connected(x: Int, y: Int): Boolean {
                return find(x) == find(y)
            }
        }
        val maxVal = nums.maxOrNull() ?: 0
        val uf = UnionFind(maxVal + 1)
        for (num in nums) {
            var n = num
            var i = 2
            while (i * i <= n) {
                if (n % i == 0) {
                    uf.union(i, num)
                    while (n % i == 0) {
                        n /= i
                    }
                }
                i++
            }
            if (n > 1) {
                uf.union(n, num)
            }
        }
        val sorted = nums.sorted()
        for (i in nums.indices) {
            if (!uf.connected(nums[i], sorted[i])) {
                return false
            }
        }
        return true
    }
}
