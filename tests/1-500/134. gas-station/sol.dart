class Solution {
  int canCompleteCircuit(List<int> gas, List<int> cost) {
    var total = 0;
    var tank = 0;
    var start = 0;
    for (var i = 0; i < gas.length; i++) {
      final diff = gas[i] - cost[i];
      total += diff;
      tank += diff;
      if (tank < 0) { tank = 0; start = i + 1; }
    }
    return total < 0 ? -1 : start;
  }
}
