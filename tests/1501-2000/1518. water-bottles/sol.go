func numWaterBottles(numBottles int, numExchange int) int {
    return numBottles + (numBottles - 1) / (numExchange - 1)
}
