class Solution {
    fun leastInterval(tasks: CharArray, n: Int): Int {
        val count = IntArray(26)
        for (t in tasks) {
            count[t - 'A']++
        }
        val f_max = count.max()
        val max_count = count.count { it == f_max }
        return maxOf(tasks.size, (f_max - 1) * (n + 1) + max_count)
    }
}
