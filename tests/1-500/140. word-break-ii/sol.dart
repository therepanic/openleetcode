class Solution {
  List<String> wordBreak(String s, List<String> wordDict) {
    final words = wordDict.toSet();
    final memo = <String, List<String>>{};
    List<String> solve(String text) {
      final cached = memo[text];
      if (cached != null) return cached;
      final result = <String>[];
      if (words.contains(text)) result.add(text);
      for (var i = 1; i < text.length; i++) {
        final prefix = text.substring(0, i);
        if (!words.contains(prefix)) continue;
        for (final tail in solve(text.substring(i))) result.add('$prefix $tail');
      }
      memo[text] = result;
      return result;
    }
    return solve(s);
  }
}
