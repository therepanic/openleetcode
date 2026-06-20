class Solution {
  String frequencySort(String s) {
    Map<String, int> freq = {};
    for (var c in s.split('')) {
      freq[c] = (freq[c] ?? 0) + 1;
    }
    var entries = freq.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    StringBuffer sb = StringBuffer();
    for (var entry in entries) {
      sb.write(entry.key * entry.value);
    }
    return sb.toString();
  }
}
