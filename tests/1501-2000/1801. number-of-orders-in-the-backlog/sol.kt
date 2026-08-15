class Solution {
    fun getNumberOfBacklogOrders(orders: Array<IntArray>): Int {
        val buy = java.util.PriorityQueue<IntArray>(compareByDescending { it[0] })
        val sell = java.util.PriorityQueue<IntArray>(compareBy { it[0] })
        for (order in orders) {
            val price = order[0]
            var amount = order[1]
            val type = order[2]
            if (type == 0) {
                while (sell.isNotEmpty() && sell.peek()[0] <= price) {
                    val s = sell.poll()
                    val sellPrice = s[0]
                    val sellAmount = s[1]
                    if (amount >= sellAmount) {
                        amount -= sellAmount
                    } else {
                        sell.offer(intArrayOf(sellPrice, sellAmount - amount))
                        amount = 0
                        break
                    }
                }
            } else {
                while (buy.isNotEmpty() && buy.peek()[0] >= price) {
                    val b = buy.poll()
                    val buyPrice = b[0]
                    val buyAmount = b[1]
                    if (amount >= buyAmount) {
                        amount -= buyAmount
                    } else {
                        buy.offer(intArrayOf(buyPrice, buyAmount - amount))
                        amount = 0
                        break
                    }
                }
            }
            if (amount > 0) {
                if (type == 0) {
                    buy.offer(intArrayOf(price, amount))
                } else {
                    sell.offer(intArrayOf(price, amount))
                }
            }
        }
        var res = 0L
        for (x in buy) res += x[1]
        for (x in sell) res += x[1]
        return (res % 1000000007).toInt()
    }
}
