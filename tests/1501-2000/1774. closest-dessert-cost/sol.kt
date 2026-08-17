class Solution {
    fun closestCost(baseCosts: IntArray, toppingCosts: IntArray, target: Int): Int {
        var s = listOf(0)
        for (i in toppingCosts) {
            val ss = mutableListOf<Int>()
            for (j in s) {
                ss.add(j)
                ss.add(j + i)
                ss.add(j + 2 * i)
            }
            s = ss
        }
        s = s.sorted()
        var ans = 1000000000
        var fans = 1000000000
        val n = s.size
        for (i in baseCosts) {
            val j = target - i
            var x = s.binarySearch(j)
            if (x < 0) x = -x - 2
            x = maxOf(x, 0)
            var ans1 = Math.abs(j - s[x])
            if (ans1 < ans) {
                ans = ans1
                fans = s[x] + i
            } else if (ans1 == ans) {
                fans = minOf(fans, s[x] + i)
            }
            if (x + 1 < n) {
                x++
                ans1 = Math.abs(j - s[x])
                if (ans1 < ans) {
                    ans = ans1
                    fans = s[x] + i
                } else if (ans1 == ans) {
                    fans = minOf(fans, s[x] + i)
                }
            }
        }
        return fans
    }
}
