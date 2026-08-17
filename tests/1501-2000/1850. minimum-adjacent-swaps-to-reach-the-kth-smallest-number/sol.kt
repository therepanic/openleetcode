class Solution {
    fun getMinSwaps(num: String, k: Int): Int {
        var arr = num.toCharArray()
        val target = num.toCharArray()
        
        repeat(k) {
            nextPermutation(target)
        }
        
        var swaps = 0
        arr = num.toCharArray()
        
        for (i in arr.indices) {
            if (arr[i] == target[i]) continue
            
            var j = i
            while (arr[j] != target[i]) j++
            
            while (j > i) {
                val temp = arr[j]
                arr[j] = arr[j - 1]
                arr[j - 1] = temp
                j--
                swaps++
            }
        }
        
        return swaps
    }
    
    private fun nextPermutation(arr: CharArray) {
        var i = arr.size - 2
        while (i >= 0 && arr[i] >= arr[i + 1]) i--
        if (i == -1) return
        
        var j = arr.size - 1
        while (arr[j] <= arr[i]) j--
        
        val temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
        
        var left = i + 1
        var right = arr.size - 1
        while (left < right) {
            val t = arr[left]
            arr[left] = arr[right]
            arr[right] = t
            left++
            right--
        }
    }
}
