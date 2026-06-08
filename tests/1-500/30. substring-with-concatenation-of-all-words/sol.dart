class Solution {
  List<int> findSubstring(String s, List<String> words) {
    final ans = <int>[];
    if (s.isEmpty || words.isEmpty) return ans;

    final wordLen = words[0].length;
    final wordCount = words.length;
    final target = <String, int>{};
    for (final word in words) {
      target[word] = (target[word] ?? 0) + 1;
    }

    for (var offset = 0; offset < wordLen; offset++) {
      var left = offset;
      var right = offset;
      var used = 0;
      final window = <String, int>{};

      while (right + wordLen <= s.length) {
        final word = s.substring(right, right + wordLen);
        right += wordLen;

        if (target.containsKey(word)) {
          window[word] = (window[word] ?? 0) + 1;
          used++;
          while (window[word]! > target[word]!) {
            final leftWord = s.substring(left, left + wordLen);
            window[leftWord] = window[leftWord]! - 1;
            left += wordLen;
            used--;
          }
          if (used == wordCount) {
            ans.add(left);
            final leftWord = s.substring(left, left + wordLen);
            window[leftWord] = window[leftWord]! - 1;
            left += wordLen;
            used--;
          }
        } else {
          window.clear();
          used = 0;
          left = right;
        }
      }
    }

    return ans;
  }
}
