class Solution {
    fun makeArrayIncreasing(arr1: IntArray, arr2: IntArray): Int {
        arr2.sort()
        val memo = HashMap<String, Int>()
        
        fun dfs(i: Int, prevMax: Int): Int {
            if (i == arr1.size) return 0
            
            val key = "$i,$prevMax"
            memo[key]?.let { return it }
            
            val j = bisectRight(arr2, prevMax)
            
            var ans = Int.MAX_VALUE / 2
            if (arr1[i] > prevMax) {
                ans = minOf(ans, dfs(i + 1, arr1[i]))
            }
            if (j < arr2.size) {
                ans = minOf(ans, dfs(i + 1, arr2[j]) + 1)
            }
            
            memo[key] = ans
            return ans
        }
        
        val ops = dfs(0, Int.MIN_VALUE)
        return if (ops >= Int.MAX_VALUE / 2) -1 else ops
    }
    
    private fun bisectRight(arr: IntArray, target: Int): Int {
        var lo = 0
        var hi = arr.size
        while (lo < hi) {
            val mid = lo + (hi - lo) / 2
            if (arr[mid] <= target) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo
    }
}
