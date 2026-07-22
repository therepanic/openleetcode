class Solution {
    fun minDays(bloomDay: IntArray, m: Int, k: Int): Int {
        if (m.toLong() * k > bloomDay.size) return -1
        
        fun f(timeLimit: Int): Boolean {
            var cntr = 0
            var bouquetCntr = 0
            for (day in bloomDay) {
                if (day <= timeLimit) {
                    cntr++
                    if (cntr == k) {
                        bouquetCntr++
                        cntr = 0
                    }
                } else {
                    cntr = 0
                }
            }
            return bouquetCntr >= m
        }
        
        var s = bloomDay.min()
        var e = bloomDay.max()
        var ans = -1
        
        while (s <= e) {
            val mid = s + (e - s) / 2
            if (f(mid)) {
                ans = mid
                e = mid - 1
            } else {
                s = mid + 1
            }
        }
        
        return ans
    }
}
