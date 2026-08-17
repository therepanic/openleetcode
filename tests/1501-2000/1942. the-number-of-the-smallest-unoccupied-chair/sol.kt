class Solution {
    fun smallestChair(times: Array<IntArray>, targetFriend: Int): Int {
        val target_time = times[targetFriend]
        times.sortBy { it[0] }

        val n = times.size
        val chair_time = IntArray(n)

        for (time in times) {
            for (i in 0 until n) {
                if (chair_time[i] <= time[0]) {
                    chair_time[i] = time[1]
                    if (time.contentEquals(target_time)) {
                        return i
                    }
                    break
                }
            }
        }

        return 0
    }
}
