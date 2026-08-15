class Solution {
    fun maxProfit(inventory: IntArray, orders: Int): Int {
        val max = inventory.max()!!
        val t = binarySearch(inventory, 0, max, orders.toLong())
        var total = 0L
        var sold = 0L
        for (ball in inventory) {
            if (ball > t) {
                val cnt = ball - t
                total += (ball + t + 1) * cnt / 2
                sold += cnt
            }
        }
        val extra = sold - orders
        val res = total - extra * (t + 1)
        return (res % 1000000007).toInt()
    }

    private fun binarySearch(arr: IntArray, left: Int, right: Int, target: Long): Long {
        var l = left
        var r = right
        while (l < r) {
            val mid = (l + r + 1) / 2
            var count = 0L
            for (x in arr) {
                if (x > mid) count += x - mid
            }
            if (count >= target) l = mid
            else r = mid - 1
        }
        return l.toLong()
    }
}
