class Solution {
    fun longestCommonSubpath(n: Int, paths: Array<IntArray>): Int {
        val combined = mutableListOf<Int>()
        val pathOrigin = mutableListOf<Int>()
        for ((i, p) in paths.withIndex()) {
            for (v in p) {
                combined.add(v)
                pathOrigin.add(i)
            }
            combined.add(-(i+1))
            pathOrigin.add(i)
        }
        val N = combined.size
        val M = paths.size
        val S = combined.toIntArray()
        val P = pathOrigin.toIntArray()

        // rank compression
        val rank = IntArray(N)
        run {
            val temp = S.copyOf()
            temp.sort()
            for (i in 0 until N) {
                rank[i] = temp.binarySearch(S[i])
            }
        }

        var k = 1
        while (k < N) {
            val keys = LongArray(N)
            for (i in 0 until N) {
                val first = rank[i].toLong()
                val second = if (i+k < N) rank[i+k].toLong() + 1L else 0L
                keys[i] = (first shl 32) or second
            }
            val sorted = keys.copyOf()
            sorted.sort()
            for (i in 0 until N) {
                rank[i] = sorted.binarySearch(keys[i])
            }
            if (k >= N) break
            k *= 2
        }

        val sa = IntArray(N)
        for (i in 0 until N) {
            sa[rank[i]] = i
        }

        val lcp = IntArray(N)
        val inv = rank.copyOf()
        var h = 0
        for (i in 0 until N) {
            if (inv[i] > 0) {
                val j = sa[inv[i]-1]
                while (i+h < N && j+h < N && S[i+h] == S[j+h]) {
                    h++
                }
                lcp[inv[i]] = h
                if (h > 0) h--
            }
        }

        var ans = 0
        var left = 0
        val count = IntArray(M)
        var distinct = 0
        val minQ = ArrayDeque<Int>()
        for (right in 0 until N) {
            val p = P[sa[right]]
            if (p >= 0) {
                if (count[p] == 0) distinct++
                count[p]++
            }
            while (!minQ.isEmpty() && lcp[minQ.last()] >= lcp[right]) {
                minQ.removeLast()
            }
            minQ.addLast(right)

            while (distinct == M) {
                while (!minQ.isEmpty() && minQ.first() <= left) {
                    minQ.removeFirst()
                }
                if (!minQ.isEmpty()) {
                    ans = maxOf(ans, lcp[minQ.first()])
                }
                val out = P[sa[left]]
                if (out >= 0) {
                    count[out]--
                    if (count[out] == 0) distinct--
                }
                left++
            }
        }
        return ans
    }
}
