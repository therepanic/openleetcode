class Solution {
  String mergeAlternately(String word1, String word2) {
    final result = StringBuffer();
    final limit = word1.length < word2.length ? word1.length : word2.length;
    for (var i = 0; i < limit; i++) {
      result.write(word1[i]);
      result.write(word2[i]);
    }
    if (word1.length > limit) result.write(word1.substring(limit));
    if (word2.length > limit) result.write(word2.substring(limit));
    return result.toString();
  }
}
