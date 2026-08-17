class Solution {
  bool checkZeroOnes(String s) {
    int max1 = 0, max0 = 0;
    int one = 0, zero = 0;
    
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '1') {
        one++;
        zero = 0;
        max1 = max1 > one ? max1 : one;
      } else {
        zero++;
        one = 0;
        max0 = max0 > zero ? max0 : zero;
      }
    }
    
    return max1 > max0;
  }
}
