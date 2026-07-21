class Solution {
  List<String> buildArray(List<int> target, int n) {
    List<int> s = [];
    List<String> res = [];
    int a = 0;
    for (int i = 1; i <= n; i++) {
      bool equal = s.length == target.length;
      if (equal) {
        for (int j = 0; j < s.length; j++) {
          if (s[j] != target[j]) {
            equal = false;
            break;
          }
        }
      }
      if (equal) return res;
      s.add(i);
      res.add("Push");
      if (s[a] != target[a]) {
        s.removeLast();
        res.add("Pop");
      } else {
        a++;
      }
    }
    return res;
  }
}
