class Solution {
    fun canCompleteCircuit(gas: IntArray, cost: IntArray): Int {
        var total = 0
        var tank = 0
        var start = 0
        var i = 0
        while (i < gas.size) {
            val diff = gas[i] - cost[i]
            total += diff
            tank += diff
            if (tank < 0) {
                tank = 0
                start = i + 1
            }
            i++
        }
        return if (total < 0) -1 else start
    }
}
