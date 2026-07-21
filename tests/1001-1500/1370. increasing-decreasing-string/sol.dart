class Solution {
  String sortString(String s) {
    if (s.isEmpty) return "";
    List<int> counts = List.filled(26, 0);
    for (int i = 0; i < s.length; i++) {
      counts[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }
    StringBuffer ans = StringBuffer();
    bool added;
    do {
      added = false;
      for (int i = 0; i < 26; i++) {
        if (counts[i] > 0) {
          ans.writeCharCode('a'.codeUnitAt(0) + i);
          counts[i]--;
          added = true;
        }
      }
      for (int i = 25; i >= 0; i--) {
        if (counts[i] > 0) {
          ans.writeCharCode('a'.codeUnitAt(0) + i);
          counts[i]--;
          added = true;
        }
      }
    } while (added);
    return ans.toString();
  }
}
