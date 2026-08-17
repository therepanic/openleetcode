class Solution {
    fun minimumTimeRequired(jobs: IntArray, k: Int): Int {
        jobs.sortDescending()
        var left = jobs[0]
        var right = jobs.sum()
        
        fun canDistribute(maxWorkload: Int): Boolean {
            val workers = IntArray(k)
            
            fun assignJob(jobIndex: Int): Boolean {
                if (jobIndex == jobs.size) return true
                for (i in 0 until k) {
                    if (workers[i] + jobs[jobIndex] <= maxWorkload) {
                        workers[i] += jobs[jobIndex]
                        if (assignJob(jobIndex + 1)) return true
                        workers[i] -= jobs[jobIndex]
                    }
                    if (workers[i] == 0) break
                }
                return false
            }
            
            return assignJob(0)
        }
        
        while (left < right) {
            val mid = (left + right) / 2
            if (canDistribute(mid)) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
