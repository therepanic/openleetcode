class Solution {
  List<String> addOperators(String num, int target) {
    List<String> res = [];
    int n = num.length;
    
    void backtrack(int idx, String path, int curr, int prev) {
      if (idx == n) {
        if (curr == target) {
          res.add(path);
        }
        return;
      }
      for (int i = idx; i < n; i++) {
        if (i > idx && num[idx] == '0') break;
        String s = num.substring(idx, i + 1);
        int val = int.parse(s);
        if (idx == 0) {
          backtrack(i + 1, s, val, val);
        } else {
          backtrack(i + 1, path + "+" + s, curr + val, val);
          backtrack(i + 1, path + "-" + s, curr - val, -val);
          backtrack(i + 1, path + "*" + s, (curr - prev) + (prev * val), prev * val);
        }
      }
    }
    
    if (n > 0) {
      backtrack(0, "", 0, 0);
    }
    return res;
  }
}
