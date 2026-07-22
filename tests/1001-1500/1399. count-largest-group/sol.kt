class Solution {
    fun countLargestGroup(n: Int): Int {
        val mpp = mutableMapOf<Int, Int>()
        var maxi = 0
        var count = 0

        for (i in 1..n) {
            val x = digsum(i)
            mpp[x] = mpp.getOrDefault(x, 0) + 1
            maxi = maxOf(maxi, mpp[x]!!)
        }

        for (v in mpp.values) {
            if (v == maxi) {
                count++
            }
        }
        return count
    }

    private fun digsum(n: Int): Int {
        var num = n
        var s = 0
        while (num > 0) {
            s += num % 10
            num /= 10
        }
        return s
    }
}
