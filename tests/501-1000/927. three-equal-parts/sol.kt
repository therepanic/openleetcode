class Solution {
    fun threeEqualParts(arr: IntArray): IntArray {
        val n = arr.size
        val ones = arr.sum()
        if (ones == 0) return intArrayOf(0, n - 1)
        if (ones % 3 != 0) return intArrayOf(-1, -1)

        val k = ones / 3
        var i1 = -1
        var i2 = -1
        var i3 = -1
        var seen = 0
        for (i in arr.indices) {
            if (arr[i] == 1) {
                seen++
                if (seen == 1) i1 = i
                else if (seen == k + 1) i2 = i
                else if (seen == 2 * k + 1) {
                    i3 = i
                    break
                }
            }
        }

        val len = n - i3
        if (i1 + len > i2 || i2 + len > i3) return intArrayOf(-1, -1)
        for (i in 0 until len) {
            if (arr[i1 + i] != arr[i2 + i] || arr[i1 + i] != arr[i3 + i]) {
                return intArrayOf(-1, -1)
            }
        }
        return intArrayOf(i1 + len - 1, i2 + len)
    }
}
