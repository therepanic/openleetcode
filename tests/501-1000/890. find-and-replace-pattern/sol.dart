class Solution {
  List<String> findAndReplacePattern(List<String> words, String pattern) {
    List<int> counts = pattern.codeUnits.map((c) => pattern.indexOf(String.fromCharCode(c))).toList();
    List<String> res = [];
    for (String word in words) {
      List<int> count = word.codeUnits.map((c) => word.indexOf(String.fromCharCode(c))).toList();
      bool match = true;
      for (int i = 0; i < count.length; i++) {
        if (count[i] != counts[i]) {
          match = false;
          break;
        }
      }
      if (match) {
        res.add(word);
      }
    }
    return res;
  }
}
