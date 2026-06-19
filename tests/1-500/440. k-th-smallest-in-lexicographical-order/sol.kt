class Solution {
    fun findKthNumber(n: Int, k: Int): Int {
        var current = 1L
        var remaining = k - 1
        while (remaining > 0) {
            val steps = countSteps(n, current, current + 1)
            if (steps <= remaining.toLong()) {
                current++
                remaining -= steps.toInt()
            } else {
                current *= 10
                remaining--
            }
        }
        return current.toInt()
    }

    private fun countSteps(n: Int, prefix: Long, nextPrefix: Long): Long {
        var cur = prefix
        var next = nextPrefix
        val limit = n.toLong() + 1
        var steps = 0L
        while (cur < limit) {
            steps += minOf(limit, next) - cur
            cur *= 10
            next *= 10
        }
        return steps
    }
}
