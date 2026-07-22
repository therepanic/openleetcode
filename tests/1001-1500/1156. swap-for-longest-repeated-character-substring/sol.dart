class Solution {
  int maxRepOpt1(String text) {
    Map<String, int> total = {};
    for (var c in text.split('')) {
      total[c] = (total[c] ?? 0) + 1;
    }
    int n = text.length;
    int ans = 0;
    
    for (var ch in total.keys) {
      int left = 0;
      int count = 0;
      
      for (int right = 0; right < n; right++) {
        if (text[right] == ch) {
          count++;
        }
        
        while ((right - left + 1) - count > 1) {
          if (text[left] == ch) {
            count--;
          }
          left++;
        }
        
        int windowLen = right - left + 1;
        ans = ans > (windowLen < total[ch]! ? windowLen : total[ch]!) 
            ? ans 
            : (windowLen < total[ch]! ? windowLen : total[ch]!);
      }
    }
    
    return ans;
  }
}
