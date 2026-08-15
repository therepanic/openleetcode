class Solution {
    fun containsPattern(arr: IntArray, m: Int, k: Int): Boolean {
        for (i in 0..arr.size - m * k) {
            var match = true
            for (j in 0 until m * (k - 1)) {
                if (arr[i + j] != arr[i + j + m]) {
                    match = false
                    break
                }
            }
            if (match) return true
        }
        return false
    }
}
