class Solution {
    fun arrayPairSum(nums: IntArray): Int {
        val bucket = IntArray(20001)
        for (x in nums) {
            bucket[x + 10000]++
        }
        var res = 0
        var flag = true
        for (i in 0 until 20001) {
            while (bucket[i] > 0) {
                if (flag) {
                    res += i - 10000
                }
                flag = !flag
                bucket[i]--
            }
        }
        return res
    }
}
