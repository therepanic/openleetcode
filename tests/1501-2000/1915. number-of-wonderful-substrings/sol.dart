class Solution {
  int wonderfulSubstrings(String word) {
    final counts = List<int>.filled(1 << 10, 0);
    counts[0] = 1;
    var mask = 0;
    var answer = 0;

    for (final code in word.codeUnits) {
      mask ^= 1 << (code - 97);
      answer += counts[mask];
      for (var bit = 0; bit < 10; bit++) {
        answer += counts[mask ^ (1 << bit)];
      }
      counts[mask]++;
    }
    return answer;
  }
}
