class Solution {
    fun getKth(lo: Int, hi: Int, k: Int): Int {
        val vc = mutableListOf<Pair<Int, Int>>()
        for (i in lo..hi) {
            var num = i
            var count = 0
            while (num != 1) {
                if (num % 2 == 0) {
                    num /= 2
                } else {
                    num = 3 * num + 1
                }
                count++
            }
            vc.add(Pair(i, count))
        }
        vc.sortWith(compareBy<Pair<Int, Int>> { it.second }.thenBy { it.first })
        return vc[k - 1].first
    }
}
