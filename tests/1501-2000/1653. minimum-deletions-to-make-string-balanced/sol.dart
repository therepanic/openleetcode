class Solution {
  int minimumDeletions(String s) {
    int res = 0;
    int count = 0;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == 'b') {
        count++;
      } else if (count > 0) {
        res++;
        count--;
      }
    }
    return res;
  }
}
