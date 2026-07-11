class Solution {
    fun maxProfitAssignment(difficulty: IntArray, profit: IntArray, worker: IntArray): Int {
        val jobs = difficulty.zip(profit).sortedBy { it.first }
        worker.sort()
        var ans = 0
        var best = 0
        var i = 0
        for (ability in worker) {
            while (i < jobs.size && jobs[i].first <= ability) {
                best = maxOf(best, jobs[i].second)
                i++
            }
            ans += best
        }
        return ans
    }
}
