class Solution {
  int getMaxRepetitions(String s1, int n1, String s2, int n2) {
    int m = s1.length;
    int n = s2.length;
    
    if (m * n1 < n * n2) {
      return 0;
    }
    
    int j = 0;
    int cnt = 0;
    int k = 0;
    
    Map<int, List<int>> seen = {};
    
    while (k < n1) {
      for (int i = 0; i < s1.length; i++) {
        if (s1[i] == s2[j]) {
          j++;
          if (j == n) {
            cnt++;
            j = 0;
          }
        }
      }
      
      k++;
      
      if (seen.containsKey(j)) {
        List<int> prev = seen[j]!;
        int prevCnt = prev[0];
        int prevK = prev[1];
        
        int periodK = k - prevK;
        int periodCnt = cnt - prevCnt;
        
        if (periodCnt == 0) {
          break;
        }
        
        int remaining = n1 - k;
        int cycles = remaining ~/ periodK;
        
        cnt += cycles * periodCnt;
        k += cycles * periodK;
      } else {
        seen[j] = [cnt, k];
      }
    }
    
    return cnt ~/ n2;
  }
}
