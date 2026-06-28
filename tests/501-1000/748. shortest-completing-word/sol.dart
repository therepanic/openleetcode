class Solution {
  String shortestCompletingWord(String licensePlate, List<String> words) {
    List<int> lp = List.filled(26, 0);
    for (var c in licensePlate.toLowerCase().split('')) {
      if (c.codeUnitAt(0) >= 97 && c.codeUnitAt(0) <= 122) {
        lp[c.codeUnitAt(0) - 97]++;
      }
    }
    String? ans;
    for (var w in words) {
      List<int> cw = List.filled(26, 0);
      for (var c in w.split('')) {
        cw[c.codeUnitAt(0) - 97]++;
      }
      bool ok = true;
      for (int i = 0; i < 26; i++) {
        if (cw[i] < lp[i]) {
          ok = false;
          break;
        }
      }
      if (ok && (ans == null || w.length < ans.length)) {
        ans = w;
      }
    }
    return ans!;
  }
}
