class Solution {
  int maxLength(List<String> arr) {
    int ans = 0;

    bool isUnique(String s) {
      int mask = 0;
      for (int i = 0; i < s.length; i++) {
        int bit = 1 << (s.codeUnitAt(i) - 'a'.codeUnitAt(0));
        if ((mask & bit) != 0) return false;
        mask |= bit;
      }
      return true;
    }

    bool hasCommon(String a, String b) {
      for (int i = 0; i < b.length; i++) {
        if (a.contains(b[i])) return true;
      }
      return false;
    }

    void dfs(int i, String path) {
      if (path.length > ans) ans = path.length;
      for (int j = i; j < arr.length; j++) {
        String s = arr[j];
        if (!isUnique(s) || hasCommon(path, s)) continue;
        dfs(j + 1, path + s);
      }
    }

    dfs(0, "");
    return ans;
  }
}
