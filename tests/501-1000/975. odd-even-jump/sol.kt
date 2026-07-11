class Solution {
    fun oddEvenJumps(arr: IntArray): Int {
        val n = arr.size
        val nextHigher = arrayOfNulls<Int>(n)
        val nextLower = arrayOfNulls<Int>(n)
        
        val indices = arr.indices.sortedBy { arr[it] }
        val stack = ArrayDeque<Int>()
        for (i in indices) {
            while (stack.isNotEmpty() && i > stack.last()) {
                nextHigher[stack.removeLast()] = i
            }
            stack.addLast(i)
        }
        
        val indicesDesc = arr.indices.sortedByDescending { arr[it] }
        stack.clear()
        for (i in indicesDesc) {
            while (stack.isNotEmpty() && i > stack.last()) {
                nextLower[stack.removeLast()] = i
            }
            stack.addLast(i)
        }
        
        val odd = BooleanArray(n)
        val even = BooleanArray(n)
        odd[n - 1] = true
        even[n - 1] = true
        
        var result = 1
        for (i in n - 2 downTo 0) {
            nextHigher[i]?.let { odd[i] = even[it] }
            nextLower[i]?.let { even[i] = odd[it] }
            if (odd[i]) result++
        }
        return result
    }
}
