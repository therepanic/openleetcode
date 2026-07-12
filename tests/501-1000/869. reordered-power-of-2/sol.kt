class Solution {
    fun reorderedPowerOf2(n: Int): Boolean {
        val signatures = intArrayOf(
            3, 5, 11, 23, 51, 35, 187, 345, 1105, 195, 330, 2530, 10846,
            10005, 90321, 260015, 341887, 11970, 154275, 1891175, 6374082,
            1074450, 1621158, 66602158, 89201295, 35070035, 191712774,
            143849475, 4757357605.toInt(), 588153930, 632937690
        )

        val primes = intArrayOf(2, 3, 5, 7, 11, 13, 17, 19, 23, 29)

        fun getSign(num: Int): Long {
            if (num == 0) return 1
            return primes[num % 10].toLong() * getSign(num / 10)
        }

        val targetSign = getSign(n)
        return signatures.contains(targetSign.toInt())
    }
}
