class Solution {
    fun largestComponentSize(nums: IntArray): Int {
        val n = nums.size
        val root = IntArray(n) { it }
        val rank = IntArray(n) { 1 }

        fun find(x: Int): Int {
            var cur = x
            while (root[cur] != cur) {
                root[cur] = root[root[cur]]
                cur = root[cur]
            }
            return cur
        }

        fun union(x: Int, y: Int) {
            val rx = find(x)
            val ry = find(y)
            if (rx == ry) return
            if (rank[rx] > rank[ry]) {
                root[ry] = rx
            } else if (rank[rx] < rank[ry]) {
                root[rx] = ry
            } else {
                root[ry] = rx
                rank[rx]++
            }
        }

        fun getPrimeFactors(num: Int): List<Int> {
            val res = mutableListOf<Int>()
            var n = num
            if (n % 2 == 0) {
                res.add(2)
                while (n % 2 == 0) n /= 2
            }
            var i = 3
            while (i * i <= n) {
                if (n % i == 0) {
                    res.add(i)
                    while (n % i == 0) n /= i
                }
                i += 2
            }
            if (n > 2) res.add(n)
            return res
        }

        val primeToIdx = mutableMapOf<Int, Int>()
        for (i in 0 until n) {
            val primes = getPrimeFactors(nums[i])
            for (p in primes) {
                if (primeToIdx.containsKey(p)) {
                    union(primeToIdx[p]!!, i)
                }
                primeToIdx[p] = i
            }
        }

        val count = mutableMapOf<Int, Int>()
        var max = 0
        for (i in 0 until n) {
            val r = find(i)
            val c = count.getOrDefault(r, 0) + 1
            count[r] = c
            if (c > max) max = c
        }
        return max
    }
}
