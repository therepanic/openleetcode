class Solution {
  int superpalindromesInRange(String left, String right) {
    int L = int.parse(left);
    int R = int.parse(right);
    int count = 0;
    for (int i = 1; i <= 100000; i++) {
      String s = i.toString();
      String rev = s.split('').reversed.join();
      int val1 = int.parse(s + rev);
      int val2 = int.parse(s + rev.substring(1));
      int sqval1 = val1 * val1;
      int sqval2 = val2 * val2;
      if (L <= sqval1 && sqval1 <= R) {
        String ssqval1 = sqval1.toString();
        if (ssqval1 == ssqval1.split('').reversed.join()) {
          count++;
        }
      }
      if (L <= sqval2 && sqval2 <= R) {
        String ssqval2 = sqval2.toString();
        if (ssqval2 == ssqval2.split('').reversed.join()) {
          count++;
        }
      }
      if (val2 > R) {
        break;
      }
    }
    return count;
  }
}
