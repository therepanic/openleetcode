class Solution {
    fun find132pattern(nums: IntArray): Boolean {
        val st = ArrayDeque<IntArray>()
        var cur_min = nums[0]

        for (i in 1 until nums.size) {
            val n = nums[i]
            while (st.isNotEmpty() && n >= st.last()[0]) {
                st.removeLast()
            }
            
            if (st.isNotEmpty() && n > st.last()[1]) {
                return true
            }
            
            st.addLast(intArrayOf(n, cur_min))
            cur_min = minOf(cur_min, n)
        }
        
        return false
    }
}
