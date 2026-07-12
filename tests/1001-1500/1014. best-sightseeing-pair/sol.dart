class Solution {
  int maxScoreSightseeingPair(List<int> values) {
    int n = values.length;
    List<int> suffixMax = List.filled(n, 0);
    suffixMax[n - 1] = values[n - 1] - (n - 1);
    
    for (int i = n - 2; i >= 0; i--) {
      suffixMax[i] = suffixMax[i + 1] > values[i] - i 
          ? suffixMax[i + 1] 
          : values[i] - i;
    }
    
    int maxScore = -1 << 63;
    for (int i = 0; i < n - 1; i++) {
      int score = values[i] + i + suffixMax[i + 1];
      if (score > maxScore) {
        maxScore = score;
      }
    }
    
    return maxScore;
  }
}
