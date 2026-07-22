class Solution {
  int numTimesAllBlue(List<int> flips) {
    int res = 0;
    int maxFlips = 0;
    
    for (int i = 0; i < flips.length; i++) {
      if (flips[i] > maxFlips) {
        maxFlips = flips[i];
      }
      if (maxFlips == i + 1) {
        res++;
      }
    }
    
    return res;
  }
}
