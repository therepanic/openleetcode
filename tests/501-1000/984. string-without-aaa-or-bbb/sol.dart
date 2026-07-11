class Solution {
  String strWithout3a3b(int a, int b) {
    StringBuffer result = StringBuffer();
    int prevA = 0;
    int prevB = 0;

    while (a > 0 || b > 0) {
      if (prevA == 2 && b > 0) {
        result.write('b');
        b--;
        prevB++;
        prevA = 0;
      } else if (prevB == 2 && a > 0) {
        result.write('a');
        a--;
        prevA++;
        prevB = 0;
      } else if (a > b && a > 0) {
        result.write('a');
        a--;
        prevA++;
        prevB = 0;
      } else {
        result.write('b');
        b--;
        prevB++;
        prevA = 0;
      }
    }

    return result.toString();
  }
}
