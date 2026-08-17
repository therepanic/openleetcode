class Solution {
    private lateinit var nums: IntArray
    private lateinit var ans: Array<IntArray>
    
    fun createSortedArray(instructions: IntArray): Int {
        val n = instructions.size
        nums = instructions
        ans = Array(n) { IntArray(2) }
        
        val arr = IntArray(n) { it }
        split(0, n - 1, arr)
        
        var realAns = 0L
        for (i in 0 until n) {
            realAns += minOf(ans[i][0], ans[i][1])
        }
        return (realAns % 1000000007).toInt()
    }
    
    private fun merge(left: IntArray, right: IntArray): IntArray {
        var l = left.size - 1
        var r = right.size - 1
        while (l > -1 && r > -1) {
            if (nums[left[l]] <= nums[right[r]]) {
                ans[right[r]][1] += (left.size - 1) - l
                r--
            } else {
                l--
            }
        }
        while (r > -1) {
            ans[right[r]][1] += left.size
            r--
        }
        
        l = 0
        r = 0
        val res = IntArray(left.size + right.size)
        var idx = 0
        while (l < left.size && r < right.size) {
            if (nums[left[l]] < nums[right[r]]) {
                res[idx++] = left[l++]
            } else {
                ans[right[r]][0] += l
                res[idx++] = right[r++]
            }
        }
        while (r < right.size) {
            ans[right[r]][0] += l
            res[idx++] = right[r++]
        }
        while (l < left.size) {
            res[idx++] = left[l++]
        }
        return res
    }
    
    private fun split(l: Int, r: Int, arr: IntArray): IntArray {
        if (l == r) {
            return intArrayOf(arr[r])
        }
        val mid = (l + r) / 2
        val left = split(l, mid, arr)
        val right = split(mid + 1, r, arr)
        return merge(left, right)
    }
}
