class Solution {
    fun getStrongest(arr: IntArray, k: Int): IntArray {
        arr.sort()
        val m = arr[(arr.size - 1) / 2]
        
        var left = 0
        var right = arr.size - 1
        val result = IntArray(k)
        for (i in 0 until k) {
            if (Math.abs(arr[right] - m) >= Math.abs(arr[left] - m)) {
                result[i] = arr[right]
                right--
            } else {
                result[i] = arr[left]
                left++
            }
        }
        return result
    }
}
