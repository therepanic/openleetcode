class Solution {
  String mostCommonWord(String paragraph, List<String> banned) {
    var bannedSet = banned.toSet();
    var counts = <String, int>{};
    var words = paragraph.toLowerCase().split(RegExp(r'[^a-z]+'));
    for (var w in words) {
      if (w.isNotEmpty && !bannedSet.contains(w)) {
        counts[w] = (counts[w] ?? 0) + 1;
      }
    }
    var maxCount = 0;
    var result = "";
    counts.forEach((k, v) {
      if (v > maxCount) {
        maxCount = v;
        result = k;
      }
    });
    return result;
  }
}
