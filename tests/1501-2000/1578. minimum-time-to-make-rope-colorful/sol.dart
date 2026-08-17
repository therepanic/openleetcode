class Solution {
  int minCost(String colors, List<int> neededTime) {
    var sum = 0;
    for (var i = 1; i < colors.length; i++) {
      if (colors[i] == colors[i - 1]) {
        sum += neededTime[i] < neededTime[i - 1] ? neededTime[i] : neededTime[i - 1];
        neededTime[i] = neededTime[i] > neededTime[i - 1] ? neededTime[i] : neededTime[i - 1];
      }
    }
    return sum;
  }
}
