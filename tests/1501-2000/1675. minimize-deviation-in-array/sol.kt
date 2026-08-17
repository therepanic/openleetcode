class Solution {
    fun minimumDeviation(nums: IntArray): Int {
        if (nums.isEmpty()) return Int.MAX_VALUE
        
        val maxHeap = PriorityQueue<Int>(Collections.reverseOrder())
        var minVal = Int.MAX_VALUE
        
        for (num in nums) {
            if (num % 2 == 0) {
                maxHeap.add(num)
                minVal = minOf(num, minVal)
            } else {
                maxHeap.add(num * 2)
                minVal = minOf(num * 2, minVal)
            }
        }
        
        var res = Int.MAX_VALUE
        while (maxHeap.peek() % 2 == 0) {
            val maxVal = maxHeap.poll()
            res = minOf(res, maxVal - minVal)
            val newNum = maxVal / 2
            maxHeap.add(newNum)
            minVal = minOf(newNum, minVal)
        }
        
        res = minOf(maxHeap.peek() - minVal, res)
        return res
    }
}
