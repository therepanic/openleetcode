class Solution {
  int minCostClimbingStairs(List<int> cost) {
    cost.add(0);
    for (int i = cost.length - 4; i >= 0; i--) {
      cost[i] += (cost[i+1] < cost[i+2] ? cost[i+1] : cost[i+2]);
    }
    return cost[0] < cost[1] ? cost[0] : cost[1];
  }
}
