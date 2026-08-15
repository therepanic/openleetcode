class Solution {
  int maxLengthBetweenEqualCharacters(String s) {
    List<int> firstPos = List.filled(26, -1);
    List<int> lastPos = List.filled(26, -1);
    int n = s.length;
    for (int i = 0; i < n; i++) {
      int idx = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
      if (firstPos[idx] == -1) firstPos[idx] = i;
    }
    for (int i = n - 1; i >= 0; i--) {
      int idx = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
      if (lastPos[idx] == -1) lastPos[idx] = i;
    }
    int maxLen = -1;
    for (int i = 0; i < 26; i++) {
      if (firstPos[i] != -1 && lastPos[i] != -1) {
        int diff = lastPos[i] - firstPos[i] - 1;
        if (diff > maxLen) maxLen = diff;
      }
    }
    return maxLen;
  }
}
