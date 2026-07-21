class Solution {
    fun maxDiff(num: Int): Int {
        val numStr = num.toString()
        val uniqueDigits = numStr.toSet()
        var maxVal = num
        var minVal = num
        
        for (digit in uniqueDigits) {
            for (newDigit in '0'..'9') {
                if (numStr[0] == digit && newDigit == '0') {
                    continue
                }
                val newNumStr = numStr.replace(digit, newDigit)
                val newNum = newNumStr.toInt()
                maxVal = maxOf(maxVal, newNum)
                minVal = minOf(minVal, newNum)
            }
        }
        
        return maxVal - minVal
    }
}
