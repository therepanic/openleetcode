class Solution {
    fun gcdOfStrings(str1: String, str2: String): String {
        if (str1 + str2 != str2 + str1) {
            return ""
        }
        
        fun gcd(len1: Int, len2: Int): Int {
            val minVal = minOf(len1, len2)
            for (i in minVal downTo 1) {
                if (len1 % i == 0 && len2 % i == 0) {
                    return i
                }
            }
            return 1
        }
        
        return str1.substring(0, gcd(str1.length, str2.length))
    }
}
