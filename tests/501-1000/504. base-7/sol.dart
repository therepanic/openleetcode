class Solution {
  String convertToBase7(int num) {
    if (num == 0) {
      return "0";
    }
    String sign = num < 0 ? "-" : "";
    num = num.abs();
    String result = "";
    while (num > 0) {
      result = (num % 7).toString() + result;
      num ~/= 7;
    }
    return sign + result;
  }
}
