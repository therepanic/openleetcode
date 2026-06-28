class Solution {
    fun reverseStr(s: String, k: Int): String {
        val arr = s.toCharArray()
        val step = 2 * k
        var i = 0
        while (i < arr.size) {
            var start = i
            var end = minOf(i + k - 1, arr.size - 1)
            while (start < end) {
                val tmp = arr[start]
                arr[start] = arr[end]
                arr[end] = tmp
                start++
                end--
            }
            i += step
        }
        return String(arr)
    }
}
