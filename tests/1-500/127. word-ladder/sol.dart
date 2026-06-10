import 'dart:collection';

class Solution {
  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    final wordSet = wordList.toSet();
    if (!wordSet.contains(endWord)) return 0;
    final queue = Queue<List<dynamic>>();
    queue.add([beginWord, 1]);
    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      final word = current[0] as String;
      final steps = current[1] as int;
      if (word == endWord) return steps;
      final chars = word.split('');
      for (var i = 0; i < chars.length; i++) {
        final original = chars[i];
        for (var code = 97; code <= 122; code++) {
          chars[i] = String.fromCharCode(code);
          final candidate = chars.join();
          if (wordSet.remove(candidate)) queue.add([candidate, steps + 1]);
        }
        chars[i] = original;
      }
    }
    return 0;
  }
}
