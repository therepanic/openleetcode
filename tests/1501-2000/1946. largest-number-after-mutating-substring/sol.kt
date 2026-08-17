class Solution {
    fun maximumNumber(num: String, change: IntArray): String {
        val a = num.toCharArray()
        var flag = false
        for (i in a.indices) {
            val b = a[i] - '0'
            if (b < change[b]) {
                a[i] = (change[b] + '0'.toInt()).toChar()
                flag = true
            } else if (b == change[b] || !flag) {
                continue
            } else {
                break
            }
        }
        return String(a)
    }
}
