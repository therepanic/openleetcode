class Solution {
  List<String> uncommonFromSentences(String s1, String s2) {
    var words = [...s1.split(' '), ...s2.split(' ')];
    var count = <String, int>{};
    for (var word in words) {
      count[word] = (count[word] ?? 0) + 1;
    }
    return count.entries.where((e) => e.value == 1).map((e) => e.key).toList();
  }
}
