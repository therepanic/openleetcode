class Solution {
    fun minDifficulty(jobDifficulty: IntArray, d: Int): Int {
        val length = jobDifficulty.size
        if (d > length) {
            return -1
        }

        val minDifficulties = Array(d) { IntArray(length) { Int.MAX_VALUE } }

        var maxDiff = 0
        var i = 0
        while (i <= length - d) {
            maxDiff = maxOf(maxDiff, jobDifficulty[i])
            minDifficulties[0][i] = maxDiff
            i++
        }

        var currentDay = 1
        while (currentDay < d) {
            var to = currentDay
            while (to <= length - d + currentDay) {
                var currentJobDifficulty = jobDifficulty[to]
                var result = Int.MAX_VALUE
                var j = to - 1
                while (j >= currentDay - 1) {
                    result = minOf(result, minDifficulties[currentDay - 1][j] + currentJobDifficulty)
                    currentJobDifficulty = maxOf(currentJobDifficulty, jobDifficulty[j])
                    j--
                }
                minDifficulties[currentDay][to] = result
                to++
            }
            currentDay++
        }

        return minDifficulties[d - 1][length - 1]
    }
}
