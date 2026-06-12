import 'dart:collection';

class Solution {
  List<List<String>> findLadders(String beginWord, String endWord, List<String> wordList) {
    final depth = <String, int>{beginWord: 1};
    final result = <List<String>>[];
    final wordSet = wordList.toSet();
    final queue = Queue<String>()..add(beginWord);
    wordSet.remove(beginWord);
    while (queue.isNotEmpty) {
      final word = queue.removeFirst();
      final steps = depth[word]!;
      if (word == endWord) break;
      final chars = word.split('');
      for (var i = 0; i < chars.length; i++) {
        final original = chars[i];
        for (var code = 97; code <= 122; code++) {
          chars[i] = String.fromCharCode(code);
          final candidate = chars.join();
          if (wordSet.remove(candidate)) {
            queue.add(candidate);
            depth[candidate] = steps + 1;
          }
        }
        chars[i] = original;
      }
    }
    if (!depth.containsKey(endWord)) return result;
    final path = <String>[endWord];
    void dfs(String word) {
      if (word == beginWord) { result.add(path.reversed.toList()); return; }
      final steps = depth[word]!;
      final chars = word.split('');
      for (var i = 0; i < chars.length; i++) {
        final original = chars[i];
        for (var code = 97; code <= 122; code++) {
          chars[i] = String.fromCharCode(code);
          final candidate = chars.join();
          final prev = depth[candidate];
          if (prev != null && prev + 1 == steps) {
            path.add(candidate);
            dfs(candidate);
            path.removeLast();
          }
        }
        chars[i] = original;
      }
    }
    dfs(endWord);
    return result;
  }
}
