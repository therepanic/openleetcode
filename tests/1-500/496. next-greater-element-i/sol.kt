class Solution {
    fun nextGreaterElement(nums1: IntArray, nums2: IntArray): IntArray {
        val nextGreater = mutableMapOf<Int, Int>()
        val stack = ArrayDeque<Int>()
        
        for (num in nums2.reversed()) {
            while (stack.isNotEmpty() && stack.last() <= num) {
                stack.removeLast()
            }
            nextGreater[num] = if (stack.isEmpty()) -1 else stack.last()
            stack.addLast(num)
        }
        
        return nums1.map { nextGreater[it]!! }.toIntArray()
    }
}
