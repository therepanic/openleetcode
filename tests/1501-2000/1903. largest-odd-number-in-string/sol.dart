class Solution {
  String largestOddNumber(String num) {
    for (int i = num.length - 1; i >= 0; i--) {
      if (int.parse(num[i]) % 2 == 1) {
        return num.substring(0, i + 1);
      }
    }
    return "";
  }
}
