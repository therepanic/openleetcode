class Solution {

    fun waysToBuildRooms(prevRoom: IntArray): Int {

        val MOD = 1_000_000_007

        val n = prevRoom.size

        val tree = Array(n) { mutableListOf<Int>() }

        for (i in 1 until n) {

            tree[prevRoom[i]].add(i)

        }

        val fact = LongArray(n + 1)

        val invFact = LongArray(n + 1)

        fact[0] = 1

        for (i in 1..n) fact[i] = fact[i - 1] * i % MOD

        invFact[n] = powMod(fact[n], (MOD - 2).toLong(), MOD.toLong()).toInt().toLong() // actually simpler to compute directly

        for (i in n downTo 1) invFact[i - 1] = invFact[i] * i % MOD

        val ways = LongArray(n)

        val size = IntArray(n)

        fun dfs(node: Int) {

            ways[node] = 1

            size[node] = 1

            for (child in tree[node]) {

                dfs(child)

                val oldSize = size[node]

                size[node] += size[child]

                ways[node] = ways[node] * comb(size[node] - 1, oldSize - 1, fact, invFact, MOD) % MOD

                ways[node] = ways[node] * ways[child] % MOD

            }

        }

        dfs(0)

        return ways[0].toInt()

    }

    private fun comb(n: Int, k: Int, fact: LongArray, invFact: LongArray, mod: Int): Long {

        if (k < 0 || k > n) return 0

        return fact[n] * invFact[k] % mod * invFact[n - k] % mod

    }

    private fun powMod(a: Long, b: Long, mod: Long): Long {

        var res = 1L

        var base = a % mod

        var exp = b

        while (exp > 0) {

            if ((exp and 1L) == 1L) res = res * base % mod

            base = base * base % mod

            exp = exp shr 1

        }

        return res

    }

}
