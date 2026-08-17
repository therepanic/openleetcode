class Solution {
  String maxValue(String n, int x) {
    String xs = x.toString();
    if (n[0] != '-') {
      for (int i = 0; i < n.length; i++) {
        if (xs[0].compareTo(n[i]) > 0) {
          return n.substring(0, i) + xs + n.substring(i);
        }
      }
      return n + xs;
    } else {
      for (int i = 1; i < n.length; i++) {
        if (xs[0].compareTo(n[i]) < 0) {
          return n.substring(0, i) + xs + n.substring(i);
        }
      }
      return n + xs;
    }
  }
}
