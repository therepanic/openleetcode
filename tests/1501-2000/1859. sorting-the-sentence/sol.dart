class Solution {
  String sortSentence(String s) {
    final words = <int, String>{};
    for (final word in s.split(' ')) {
      final key = int.parse(word[word.length - 1]);
      words[key] = word.substring(0, word.length - 1);
    }
    return List<int>.generate(9, (i) => i + 1)
        .where(words.containsKey)
        .map((i) => words[i]!)
        .join(' ');
  }
}
