class Solution {
  int numSub(String s) {
    int cnt = 0;
    int total = 0;
    int mod = 1000000007;
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '1') {
        cnt++;
      } else {
        cnt = 0;
      }
      total = (total + cnt) % mod;
    }
    return total;
  }
}
