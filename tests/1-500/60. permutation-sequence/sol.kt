class Solution {
    fun getPermutation(n: Int, k: Int): String {
        val nums = mutableListOf<Int>()
        val factorial = IntArray(n + 1)
        factorial[0] = 1

        for (i in 1..n) {
            nums.add(i)
            factorial[i] = factorial[i - 1] * i
        }

        var remainingK = k - 1
        val res = StringBuilder()
        for (remaining in n downTo 1) {
            val block = factorial[remaining - 1]
            val idx = remainingK / block
            remainingK %= block
            res.append(nums[idx])
            nums.removeAt(idx)
        }
        return res.toString()
    }
}
