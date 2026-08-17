class Solution {
  String longestSubsequenceRepeatedK(String s, int k) {
    bool isK(String sub, String t, int k) {
      int count = 0;
      int i = 0;
      for (int idx = 0; idx < t.length; idx++) {
        if (i < sub.length && t[idx] == sub[i]) {
          i++;
          if (i == sub.length) {
            i = 0;
            count++;
            if (count == k) return true;
          }
        }
      }
      return false;
    }

    String res = "";
    List<String> q = [""];
    while (q.isNotEmpty) {
      String curr = q.removeAt(0);
      for (int c = 97; c <= 122; c++) {
        String nxt = curr + String.fromCharCode(c);
        if (isK(nxt, s, k)) {
          res = nxt;
          q.add(nxt);
        }
      }
    }
    return res;
  }
}
