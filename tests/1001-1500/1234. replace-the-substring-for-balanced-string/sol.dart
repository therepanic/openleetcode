class Solution {
  int balancedString(String s) {
    int n = s.length;
    int each = n ~/ 4;
    Map<String, int> count = {};
    for (int i = 0; i < n; i++) {
      String c = s[i];
      count[c] = (count[c] ?? 0) + 1;
    }
    Map<String, int> extra = {};
    for (var entry in count.entries) {
      if (entry.value > each) {
        extra[entry.key] = entry.value - each;
      }
    }
    if (extra.isEmpty) return 0;
    int left = 0;
    int res = 1 << 60;
    Map<String, int> curr = {};
    for (int right = 0; right < n; right++) {
      String rc = s[right];
      if (extra.containsKey(rc)) {
        curr[rc] = (curr[rc] ?? 0) + 1;
      }
      bool allMet() {
        for (var e in extra.entries) {
          if ((curr[e.key] ?? 0) < e.value) return false;
        }
        return true;
      }
      while (allMet() && left <= right) {
        if (right - left + 1 < res) {
          res = right - left + 1;
        }
        String lc = s[left];
        if (curr.containsKey(lc)) {
          curr[lc] = curr[lc]! - 1;
          if (curr[lc] == 0) {
            curr.remove(lc);
          }
        }
        left++;
      }
    }
    return res;
  }
}
