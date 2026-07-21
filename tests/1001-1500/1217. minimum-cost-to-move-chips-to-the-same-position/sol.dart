class Solution {
  int minCostToMoveChips(List<int> position) {
    int even = 0, odd = 0;
    for (int i in position) {
      if (i % 2 == 0) {
        even++;
      } else {
        odd++;
      }
    }
    return even < odd ? even : odd;
  }
}
