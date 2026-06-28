class Solution {
  List<int> selfDividingNumbers(int left, int right) {
    List<int> lst = [];
    for (int i = left; i <= right; i++) {
      String s = i.toString();
      if (s.contains('0')) continue;
      int b = 1;
      for (int k = 0; k < s.length; k++) {
        int digit = int.parse(s[k]);
        if (i % digit != 0) {
          b = 0;
          break;
        }
      }
      if (b == 1) lst.add(i);
    }
    return lst;
  }
}
