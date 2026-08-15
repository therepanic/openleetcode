class Solution {
    fun checkArithmeticSubarrays(nums: IntArray, l: IntArray, r: IntArray): List<Boolean> {
        val ans = mutableListOf<Boolean>()
        for (i in l.indices) {
            val sub = nums.copyOfRange(l[i], r[i]+1).sorted()
            var valid = true
            if (sub.size > 2) {
                val d = sub[1] - sub[0]
                for (j in 1 until sub.size-1) {
                    if (sub[j+1] - sub[j] != d) {
                        valid = false
                        break
                    }
                }
            }
            ans.add(valid)
        }
        return ans
    }
}
