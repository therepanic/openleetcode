class Solution {
    fun pancakeSort(arr: IntArray): List<Int> {
        val n = arr.size
        val result = mutableListOf<Int>()
        
        for (i in 0 until n) {
            val target = n - i
            var position = 0
            
            for (j in 0 until n - i) {
                if (arr[j] == target) {
                    position = j
                    break
                }
            }
            
            if (position == n - i - 1) {
                continue
            }
            
            if (position > 0) {
                result.add(position + 1)
                arr.reverse(0, position)
            }
            
            result.add(n - i)
            arr.reverse(0, n - i - 1)
        }
        
        return result
    }
    
    private fun IntArray.reverse(start: Int, end: Int) {
        var left = start
        var right = end
        while (left < right) {
            val temp = this[left]
            this[left] = this[right]
            this[right] = temp
            left++
            right--
        }
    }
}
