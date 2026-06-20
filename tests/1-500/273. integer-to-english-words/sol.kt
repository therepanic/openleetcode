class Solution {
    private val ones = arrayOf(
        "Zero",
        "One",
        "Two", 
        "Three", 
        "Four", 
        "Five", 
        "Six", 
        "Seven", 
        "Eight", 
        "Nine", 
        "Ten", 
        "Eleven", 
        "Twelve", 
        "Thirteen", 
        "Fourteen", 
        "Fifteen", 
        "Sixteen", 
        "Seventeen", 
        "Eighteen", 
        "Nineteen"
    )

    private val tens = arrayOf(
        "Zero",
        "Ten",
        "Twenty",
        "Thirty", 
        "Forty", 
        "Fifty", 
        "Sixty", 
        "Seventy", 
        "Eighty", 
        "Ninety"
    )

    private val magnitude = arrayOf(
        "",
        "Thousand",
        "Million",
        "Billion",
        "Trillion"
    )

    private fun helper3Digit(n: Int): String {
        var num = n
        var ans = ""
        var count = 0
        var rem: Int
        var prevRem = 0

        while (num > 0) {
            count++
            rem = num % 10
            num /= 10

            if (rem == 0) {
                continue
            } else if (count == 1) {
                ans += ones[rem]
            } else if (count == 2) {
                if (rem == 1) {
                    ans = ones[rem * 10 + prevRem]
                } else {
                    ans = tens[rem] + " " + ans
                }
            } else if (count == 3) {
                ans = ones[rem] + " Hundred " + ans
            }
            prevRem = rem
        }

        return ans.trim()
    }

    fun numberToWords(num: Int): String {
        if (num == 0) {
            return "Zero"
        }

        var n = num
        var ans = ""
        var count = 0

        while (n > 0) {
            val rem = n % 1000
            if (rem != 0) {
                ans = helper3Digit(rem) + " " + magnitude[count] + " " + ans
            }
            n /= 1000
            count++
        }

        return ans.trim()
    }
}
