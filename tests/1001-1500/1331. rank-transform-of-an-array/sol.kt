class Solution {
    fun arrayRankTransform(arr: IntArray): IntArray {
        val s = arr.sorted()
        val unique = mutableListOf<Int>()
        for (x in s) {
            if (unique.isEmpty() || unique.last() != x) {
                unique.add(x)
            }
        }
        for (i in arr.indices) {
            arr[i] = bisectLeft(unique, arr[i]) + 1
        }
        return arr
    }
    
    private fun bisectLeft(a: List<Int>, x: Int): Int {
        var lo = 0
        var hi = a.size
        while (lo < hi) {
            val mid = (lo + hi) / 2
            if (a[mid] < x) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo
    }
}
