class Solution {
  String nextGreatestLetter(List<String> letters, String target) {
    String res = letters[0];
    bool flag = false;

    for (String ch in letters) {
      if (!flag) {
        if (ch.compareTo(target) > 0) {
          res = ch;
          flag = !flag;
        }
      } else {
        if (ch.compareTo(target) > 0 && ch.compareTo(res) < 0) {
          res = ch;
        }
      }
    }

    return res;
  }
}
