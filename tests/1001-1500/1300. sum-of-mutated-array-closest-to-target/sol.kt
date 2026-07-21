class Solution {
    fun findBestValue(arr: IntArray, target: Int): Int {
        var low = 0
        var high = arr.max()
        var result = high
        var minDiff = Int.MAX_VALUE
        
        while (low <= high) {
            val mid = low + (high - low) / 2
            val currSum = arr.sumOf { minOf(it, mid) }
            val diff = Math.abs(currSum - target)
            
            if (diff < minDiff || (diff == minDiff && mid < result)) {
                minDiff = diff
                result = mid
            }
            
            if (currSum < target) {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return result
    }
}
