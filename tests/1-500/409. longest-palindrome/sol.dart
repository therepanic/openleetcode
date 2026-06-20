class Solution {
  int longestPalindrome(String s) {
    Map<String, int> count = {};
    for (var c in s.split('')) {
      count[c] = (count[c] ?? 0) + 1;
    }
    
    int maxLen = 0;
    bool odd = false;
    
    for (var freq in count.values) {
      if (freq % 2 == 0) {
        maxLen += freq;
      } else {
        maxLen += freq - 1;
        odd = true;
      }
    }
    
    return maxLen + (odd ? 1 : 0);
  }
}
