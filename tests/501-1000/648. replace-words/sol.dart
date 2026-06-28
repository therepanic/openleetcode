class Solution {
  String replaceWords(List<String> dictionary, String sentence) {
    final roots = dictionary.toSet();
    final words = sentence.split(" ");
    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      var replacement = word;
      for (var j = 1; j <= word.length; j++) {
        final prefix = word.substring(0, j);
        if (roots.contains(prefix)) {
          replacement = prefix;
          break;
        }
      }
      words[i] = replacement;
    }
    return words.join(" ");
  }
}
