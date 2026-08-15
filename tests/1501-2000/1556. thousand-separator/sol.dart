class Solution {
  String thousandSeparator(int n) {
    String s = n.toString();
    if (s.length <= 3) return s;
    StringBuffer sb = StringBuffer();
    int count = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      sb.write(s[i]);
      count++;
      if (count % 3 == 0 && i > 0) {
        sb.write('.');
      }
    }
    return sb.toString().split('').reversed.join();
  }
}
