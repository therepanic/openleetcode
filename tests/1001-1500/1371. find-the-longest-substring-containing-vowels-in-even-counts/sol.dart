class Solution {
  int findTheLongestSubstring(String s) {
    List<int> mapy = List.filled(32, -2);
    mapy[0] = -1;

    int res = 0;
    int mask = 0;

    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == 'a') mask ^= 1;
      else if (c == 'e') mask ^= 2;
      else if (c == 'i') mask ^= 4;
      else if (c == 'o') mask ^= 8;
      else if (c == 'u') mask ^= 16;

      int prev = mapy[mask];
      if (prev == -2) {
        mapy[mask] = i;
      } else {
        if (i - prev > res) res = i - prev;
      }
    }

    return res;
  }
}
