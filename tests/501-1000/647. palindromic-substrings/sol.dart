class Solution {
  int countSubstrings(String s) {
    int count = 0;
    
    int expand(int left, int right) {
      int res = 0;
      while (left >= 0 && right < s.length && s[left] == s[right]) {
        res++;
        left--;
        right++;
      }
      return res;
    }
    
    for (int i = 0; i < s.length; i++) {
      count += expand(i, i);
      count += expand(i, i + 1);
    }
    
    return count;
  }
}
