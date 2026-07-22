class Solution {
  int maxArea(int h, int w, List<int> horizontalCuts, List<int> verticalCuts) {
    const int MOD = 1000000007;
    
    horizontalCuts.sort();
    verticalCuts.sort();
    
    int maxH = max(horizontalCuts[0], h - horizontalCuts.last);
    for (int i = 1; i < horizontalCuts.length; i++) {
      maxH = max(maxH, horizontalCuts[i] - horizontalCuts[i - 1]);
    }
    
    int maxV = max(verticalCuts[0], w - verticalCuts.last);
    for (int i = 1; i < verticalCuts.length; i++) {
      maxV = max(maxV, verticalCuts[i] - verticalCuts[i - 1]);
    }
    
    return (maxH * maxV) % MOD;
  }
}
