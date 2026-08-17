class Solution {
  bool closeStrings(String word1, String word2) {
    if (word1.length != word2.length) return false;
    Set<String> set1 = word1.split('').toSet();
    Set<String> set2 = word2.split('').toSet();
    if (!set1.containsAll(set2) || !set2.containsAll(set1)) return false;
    Map<int, int> dct = {};
    set1.forEach((x) {
      int n1 = word1.split('').where((c) => c == x).length;
      int n2 = word2.split('').where((c) => c == x).length;
      dct[n1] = (dct[n1] ?? 0) + 1;
      dct[n2] = (dct[n2] ?? 0) - 1;
    });
    return dct.values.every((v) => v == 0);
  }
}
