class Solution {
    fun racecar(target: Int): Int {
        val q = ArrayDeque<Triple<Int, Int, Int>>()
        q.addLast(Triple(0, 1, 0))
        while (q.isNotEmpty()) {
            val (cp, cs, nm) = q.removeFirst()
            if (cp == target) return nm
            q.addLast(Triple(cp + cs, cs * 2, nm + 1))
            if ((cp + cs > target && cs > 0) || (cp + cs < target && cs < 0)) {
                if (cs < 0) {
                    q.addLast(Triple(cp, 1, nm + 1))
                } else {
                    q.addLast(Triple(cp, -1, nm + 1))
                }
            }
        }
        return -1
    }
}
