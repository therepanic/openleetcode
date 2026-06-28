class Solution {
  int findLUSlength(String a, String b) {
    if (a == b) {
      return -1;
    } else {
      return a.length > b.length ? a.length : b.length;
    }
  }
}
