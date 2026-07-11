class Solution {
    fun primePalindrome(n: Int): Int {
        var current = n
        fun isPrime(num: Int): Boolean {
            if (num < 2) return false
            if (num % 2 == 0) return num == 2
            var i = 3
            while (i * i <= num) {
                if (num % i == 0) return false
                i += 2
            }
            return true
        }

        if (current in 8..11) return 11

        while (true) {
            val s = current.toString()
            if (s.length % 2 == 0 && current > 11) {
                current = Math.pow(10.0, s.length.toDouble()).toInt() + 1
                continue
            }
            if (s == s.reversed() && isPrime(current)) return current
            current++
            if (current > 2 && current % 2 == 0) current++
        }
    }
}
