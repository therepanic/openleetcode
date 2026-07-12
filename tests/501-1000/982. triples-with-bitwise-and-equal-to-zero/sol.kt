class Solution {
    fun countTriplets(nums: IntArray): Int {
        var most = 0
        for (num in nums) {
            if (num > most) most = num
        }
        if (most == 0) return nums.size * nums.size * nums.size

        var bits = 0
        var tmp = most
        while (tmp > 0) { bits++; tmp = tmp shr 1 }
        val N = 1 shl bits

        val c = IntArray(N)
        for (num in nums) c[num]++

        var h = 1
        while (h < N) {
            var s = 0
            while (s < N) {
                for (i in s until s + h) {
                    c[i] += c[i + h]
                }
                s += h shl 1
            }
            h = h shl 1
        }

        for (i in 0 until N) {
            c[i] = c[i] * c[i] * c[i]
        }

        h = 1
        while (h < N) {
            var s = 0
            while (s < N) {
                for (i in s until s + h) {
                    c[i] -= c[i + h]
                }
                s += h shl 1
            }
            h = h shl 1
        }

        return c[0]
    }
}
