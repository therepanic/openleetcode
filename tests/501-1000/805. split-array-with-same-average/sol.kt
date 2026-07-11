class Solution {
    fun splitArraySameAverage(nums: IntArray): Boolean {
        val n = nums.size
        if (n < 2) return false
        val total = nums.sum()
        val transformed = nums.map { it * n - total }
        
        val mid = n shr 1
        fun generate(arr: List<Int>): Map<Int, MutableSet<Int>> {
            val mp = mutableMapOf<Int, MutableSet<Int>>()
            for (mask in 1 until (1 shl arr.size)) {
                var sum = 0
                var cnt = 0
                for (i in arr.indices) {
                    if (mask and (1 shl i) != 0) {
                        sum += arr[i]
                        cnt++
                    }
                }
                mp.getOrPut(cnt) { mutableSetOf() }.add(sum)
            }
            return mp
        }
        
        val mpA = generate(transformed.take(mid))
        val mpB = generate(transformed.drop(mid))
        
        for ((cnt, set) in mpA) {
            if (0 in set && cnt != 0) return true
        }
        for ((cnt, set) in mpB) {
            if (0 in set && cnt != 0) return true
        }
        
        for ((cntA, setA) in mpA) {
            for ((cntB, setB) in mpB) {
                val totalCnt = cntA + cntB
                if (totalCnt == 0 || totalCnt == n) continue
                for (v in setA) {
                    if (-v in setB) return true
                }
            }
        }
        return false
    }
}
