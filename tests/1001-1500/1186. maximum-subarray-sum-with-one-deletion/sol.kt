class Solution {
    fun maximumSum(arr: IntArray): Int {
        val n = arr.size
        if (n == 1) {
            return arr[0]
        }
        
        var maxNoDelete = arr[0]
        var maxOneDelete = arr[0]
        var result = arr[0]
        
        for (i in 1 until n) {
            val prevNoDelete = maxNoDelete
            maxNoDelete = maxOf(maxNoDelete + arr[i], arr[i])
            maxOneDelete = maxOf(maxOneDelete + arr[i], prevNoDelete)
            result = maxOf(result, maxNoDelete, maxOneDelete)
        }
        
        return result
    }
}
