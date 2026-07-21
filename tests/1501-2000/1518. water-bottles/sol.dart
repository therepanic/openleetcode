class Solution {
  int numWaterBottles(int numBottles, int numExchange) {
    return numBottles + (numBottles - 1) ~/ (numExchange - 1);
  }
}
