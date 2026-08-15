class Solution {
    fun maxSumMinProduct(nums: IntArray): Int {
        val n = nums.size
        val prefix = LongArray(n + 1)
        for (i in 0 until n) prefix[i+1] = prefix[i] + nums[i]
        
        val leftBound = IntArray(n) { -1 }
        val rightBound = IntArray(n) { n }
        val stack = ArrayDeque<Int>()
        for (i in 0 until n) {
            while (stack.isNotEmpty() && nums[stack.last()] > nums[i]) {
                rightBound[stack.removeLast()] = i
            }
            stack.addLast(i)
        }
        stack.clear()
        for (i in n-1 downTo 0) {
            while (stack.isNotEmpty() && nums[stack.last()] > nums[i]) {
                leftBound[stack.removeLast()] = i
            }
            stack.addLast(i)
        }
        
        var maxProd = 0L
        for (i in 0 until n) {
            val l = leftBound[i]
            val r = rightBound[i]
            val total = prefix[r] - prefix[l+1]
            maxProd = maxOf(maxProd, nums[i].toLong() * total)
        }
        return (maxProd % 1000000007L).toInt()
    }
}
