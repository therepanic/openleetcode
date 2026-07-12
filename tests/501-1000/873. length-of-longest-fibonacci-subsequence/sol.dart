class Solution {
  int lenLongestFibSubseq(List<int> arr) {
    int n = arr.length;
    List<List<int>> dp = List.generate(n, (_) => List.filled(n, 0));
    int maxLen = 0;
    
    for (int curr = 2; curr < n; curr++) {
      int start = 0;
      int end = curr - 1;
      
      while (start < end) {
        int pairSum = arr[start] + arr[end];
        
        if (pairSum > arr[curr]) {
          end--;
        } else if (pairSum < arr[curr]) {
          start++;
        } else {
          dp[end][curr] = dp[start][end] + 1;
          if (dp[end][curr] > maxLen) {
            maxLen = dp[end][curr];
          }
          end--;
          start++;
        }
      }
    }
    
    return maxLen > 0 ? maxLen + 2 : 0;
  }
}
