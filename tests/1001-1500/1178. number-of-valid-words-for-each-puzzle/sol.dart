class Solution {
  List<int> findNumOfValidWords(List<String> words, List<String> puzzles) {
    int getMask(String s) {
      int mask = 0;
      for (int i = 0; i < s.length; i++) {
        mask |= 1 << (s.codeUnitAt(i) - 97);
      }
      return mask;
    }
    
    Map<int, int> wordCount = {};
    for (var w in words) {
      int mask = getMask(w);
      wordCount[mask] = (wordCount[mask] ?? 0) + 1;
    }
    
    List<int> result = [];
    for (var p in puzzles) {
      int firstMask = 1 << (p.codeUnitAt(0) - 97);
      int puzzleMask = getMask(p);
      int sub = puzzleMask;
      int count = 0;
      while (true) {
        if ((sub & firstMask) != 0) {
          count += wordCount[sub] ?? 0;
        }
        if (sub == 0) break;
        sub = (sub - 1) & puzzleMask;
      }
      result.add(count);
    }
    return result;
  }
}
