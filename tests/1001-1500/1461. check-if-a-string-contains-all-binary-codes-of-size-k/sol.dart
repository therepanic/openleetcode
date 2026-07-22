class Solution {
  bool hasAllCodes(String s, int k) {
    int req = 1 << k;
    List<bool> seen = List<bool>.filled(req, false);
    int mask = req - 1;
    int h = 0;

    for (int i = 0; i < s.length; i++) {
      h = ((h << 1) & mask) | (s.codeUnitAt(i) & 1);

      if (i >= k - 1 && !seen[h]) {
        seen[h] = true;
        req--;
        if (req == 0) return true;
      }
    }

    return false;
  }
}
