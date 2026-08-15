class Solution {
    fun averageWaitingTime(customers: Array<IntArray>): Double {
        var waiting = 0L
        var current = 0
        for (customer in customers) {
            val arrival = customer[0]
            val time = customer[1]
            if (current <= arrival) {
                current = arrival + time
                waiting += time
            } else {
                current += time
                waiting += (current - arrival)
            }
        }
        return waiting.toDouble() / customers.size
    }
}
