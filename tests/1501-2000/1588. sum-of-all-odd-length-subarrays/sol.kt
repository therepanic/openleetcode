class Solution {
    fun sumOddLengthSubarrays(arr: IntArray): Int {
        var s = arr.sum()
        var l = arr.size - 1
        var i = 2
        while (l >= i) {
            var j = 0
            var e = i
            while (e <= l) {
                for (k in j..e) s += arr[k]
                j++
                e++
            }
            i += 2
        }
        return s
    }
}
