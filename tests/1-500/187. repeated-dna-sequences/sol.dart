class Solution {
  List<String> findRepeatedDnaSequences(String s) {
    final seen = <String, int>{};
    final ans = <String>[];
    for (int i = 0; i + 10 <= s.length; i++) {
      final sub = s.substring(i, i + 10);
      final count = seen[sub] ?? 0;
      if (count == 1) ans.add(sub);
      seen[sub] = count + 1;
    }
    return ans;
  }
}
