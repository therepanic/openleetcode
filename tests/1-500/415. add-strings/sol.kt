class Solution {
    fun addStrings(num1: String, num2: String): String {
        val result = StringBuilder()
        var carry = 0
        var i = num1.length - 1
        var j = num2.length - 1
        
        while (i >= 0 || j >= 0 || carry > 0) {
            val digit1 = if (i >= 0) num1[i] - '0' else 0
            val digit2 = if (j >= 0) num2[j] - '0' else 0
            
            val total = digit1 + digit2 + carry
            carry = total / 10
            result.append((total % 10 + '0'.code).toChar())
            
            i--
            j--
        }
        
        return result.reverse().toString()
    }
}
