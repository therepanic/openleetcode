class Solution {
    fun minimumJumps(forbidden: IntArray, a: Int, b: Int, x: Int): Int {
        var idx = 1
        for (i in 2..minOf(a, b)) {
            if (a % i == 0 && b % i == 0) idx = i
        }
        if (x % idx != 0) return -1
        val q = ArrayDeque<Triple<Int, Int, Int>>()
        q.add(Triple(0, 1, 0))
        val visited = HashSet<Int>()
        visited.add(0)
        forbidden.forEach { visited.add(it) }
        val top = forbidden.maxOrNull() ?: 0
        val limit = top + x + a + b
        while (q.isNotEmpty()) {
            val (curr, prev, step) = q.removeFirst()
            if (curr == x) return step
            if (prev == 1) {
                val nb = curr - b
                if (nb >= 0 && !visited.contains(nb)) {
                    visited.add(nb)
                    q.add(Triple(nb, -1, step + 1))
                }
            }
            val na = curr + a
            if (na <= limit && !visited.contains(na)) {
                visited.add(na)
                q.add(Triple(na, 1, step + 1))
            }
        }
        return -1
    }
}
