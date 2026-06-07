class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    final groups = <String, List<String>>{};
    final keys = <String>[];

    for (final word in strs) {
      final chars = word.split('')..sort();
      final key = chars.join();
      if (!groups.containsKey(key)) {
        groups[key] = <String>[];
        keys.add(key);
      }
      groups[key]!.add(word);
    }

    return keys.map((key) => groups[key]!).toList();
  }
}
