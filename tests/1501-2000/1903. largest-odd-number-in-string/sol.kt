class Solution {
    fun largestOddNumber(num: String): String {
        for (i in num.length - 1 downTo 0) {
            if (num[i].digitToInt() % 2 == 1) {
                return num.substring(0, i + 1)
            }
        }
        return ""
    }
}
