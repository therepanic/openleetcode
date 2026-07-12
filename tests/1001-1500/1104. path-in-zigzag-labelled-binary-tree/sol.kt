class Solution {
    fun pathInZigZagTree(label: Int): List<Int> {
        val res = mutableListOf<Int>()
        var cur = label
        while (cur > 0) {
            res.add(cur)
            var start = 1
            while (start * 2 <= cur) {
                start *= 2
            }
            val end = start * 2 - 1
            cur = (start + end - cur) / 2
        }
        res.reverse()
        return res
    }
}
