class Solution {
  int getLucky(String s, int k) {
    String res = '';
    for (int i = 0; i < s.length; i++) {
      res += (s.codeUnitAt(i) - 'a'.codeUnitAt(0) + 1).toString();
    }
    for (int i = 0; i < k; i++) {
      int sum = 0;
      for (int j = 0; j < res.length; j++) {
        sum += int.parse(res[j]);
      }
      res = sum.toString();
    }
    return int.parse(res);
  }
}
