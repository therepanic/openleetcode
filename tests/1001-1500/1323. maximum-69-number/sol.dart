class Solution {
  int maximum69Number (int num) {
    String s = num.toString();
    s = s.replaceFirst('6', '9');
    return int.parse(s);
  }
}
