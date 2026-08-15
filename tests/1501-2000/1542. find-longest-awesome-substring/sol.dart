class Solution {
  int longestAwesome(String s) {
    int n = s.length;
    Map<int, int> mask = {};
    int curMask = 0;
    mask[curMask] = -1;
    int ans = 1;
    for (int i = 0; i < n; i++) {
      int num = s.codeUnitAt(i) - 48;
      curMask ^= (1 << num);
      int needMask = curMask;
      if (mask.containsKey(needMask)) {
        final length = i - mask[needMask]!;
        if (length > ans) ans = length;
      }
      for (int bit = 0; bit < 10; bit++) {
        int nNeedMax = needMask ^ (1 << bit);
        if (mask.containsKey(nNeedMax)) {
          final length = i - mask[nNeedMax]!;
          if (length > ans) ans = length;
        }
      }
      mask.putIfAbsent(curMask, () => i);
    }
    return ans;
  }
}
