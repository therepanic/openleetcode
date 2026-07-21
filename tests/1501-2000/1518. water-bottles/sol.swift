class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        return numBottles + (numBottles - 1) / (numExchange - 1)
    }
}
