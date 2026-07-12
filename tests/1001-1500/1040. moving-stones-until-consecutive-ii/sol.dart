class Solution {
  List<int> numMovesStonesII(List<int> stones) {
    stones.sort();
    int n = stones.length;
    
    int maxMoves = max(stones[n - 1] - stones[1] - (n - 2), 
                       stones[n - 2] - stones[0] - (n - 2));
    
    int minMoves = n;
    int left = 0;
    for (int right = 0; right < n; right++) {
      while (stones[right] - stones[left] + 1 > n) {
        left++;
      }
      int currentWindowSize = right - left + 1;
      if (currentWindowSize == n - 1 && stones[right] - stones[left] + 1 == n - 1) {
        minMoves = min(minMoves, 2);
      } else {
        minMoves = min(minMoves, n - currentWindowSize);
      }
    }
    
    return [minMoves, maxMoves];
  }
}
