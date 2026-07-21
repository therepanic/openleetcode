class Solution {
  int minTaps(int n, List<int> ranges) {
    List<int> maxRange = List.filled(n + 1, 0);
    
    for (int i = 0; i < ranges.length; i++) {
      int left = (0 > i - ranges[i]) ? 0 : i - ranges[i];
      int right = (n < i + ranges[i]) ? n : i + ranges[i];
      maxRange[left] = (maxRange[left] > right) ? maxRange[left] : right;
    }
    
    int end = 0, farthest = 0, taps = 0;
    int i = 0;
    
    while (end < n) {
      while (i <= end) {
        farthest = (farthest > maxRange[i]) ? farthest : maxRange[i];
        i++;
      }
      
      if (farthest <= end) {
        return -1;
      }
      
      end = farthest;
      taps++;
    }
    
    return taps;
  }
}
