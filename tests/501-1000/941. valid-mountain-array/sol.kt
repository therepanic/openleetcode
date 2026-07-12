class Solution {
    fun validMountainArray(arr: IntArray): Boolean {
        val n = arr.size
        var i = 0
        
        while (i+1 < n && arr[i] < arr[i+1]) {
            i++
        }
        
        if (i == 0 || i == n-1) {
            return false
        }
        
        while (i+1 < n && arr[i] > arr[i+1]) {
            i++
        }
        
        return i == n-1
    }
}
