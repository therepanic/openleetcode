class Solution {
  int longestWPI(List<int> hours) {
    int score = 0;
    int longestInterval = 0;
    Map<int, int> seenAt = {0: -1};
    
    for (int i = 0; i < hours.length; i++) {
      score += hours[i] > 8 ? 1 : -1;
      
      if (score > 0) {
        longestInterval = i + 1;
      } else if (seenAt.containsKey(score - 1)) {
        int candidate = i - seenAt[score - 1]!;
        if (candidate > longestInterval) {
          longestInterval = candidate;
        }
      }
      
      if (!seenAt.containsKey(score)) {
        seenAt[score] = i;
      }
    }
    
    return longestInterval;
  }
}
