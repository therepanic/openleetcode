class Solution {
    fun numWaterBottles(numBottles: Int, numExchange: Int): Int {
        return numBottles + (numBottles - 1) / (numExchange - 1)
    }
}
