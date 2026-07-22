class Solution {
    fun longestSubsequence(arr: IntArray, difference: Int): Int {
        val dic = mutableMapOf<Int, Int>()
        for (x in arr) {
            if (dic.containsKey(x - difference)) {
                dic[x] = dic[x - difference]!! + 1
            } else {
                dic[x] = 1
            }
        }
        return dic.values.max()
    }
}
