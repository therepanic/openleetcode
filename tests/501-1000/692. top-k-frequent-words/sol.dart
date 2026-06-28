class Solution {
  List<String> topKFrequent(List<String> words, int k) {
    final counter = <String, int>{};
    for (final w in words) {
      counter[w] = (counter[w] ?? 0) + 1;
    }
    final entries = counter.entries.toList();
    entries.sort((a, b) {
      final c = b.value.compareTo(a.value);
      if (c != 0) return c;
      return a.key.compareTo(b.key);
    });
    return entries.take(k).map((e) => e.key).toList();
  }
}
