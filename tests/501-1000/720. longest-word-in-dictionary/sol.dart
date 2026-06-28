class Solution {
  String longestWord(List<String> words) {
    TrieNode root = TrieNode();
    for (int i = 0; i < words.length; i++) {
      TrieNode cur = root;
      for (int j = 0; j < words[i].length; j++) {
        String ch = words[i][j];
        if (!cur.children.containsKey(ch)) {
          cur.children[ch] = TrieNode();
        }
        cur = cur.children[ch]!;
      }
      cur.end = i;
    }

    List<TrieNode> stack = List.from(root.children.values);
    String ans = "";
    while (stack.isNotEmpty) {
      TrieNode cur = stack.removeLast();
      if (cur.end != -1) {
        String word = words[cur.end];
        if (word.length > ans.length || (word.length == ans.length && word.compareTo(ans) < 0)) {
          ans = word;
        }
        for (var entry in cur.children.entries) {
          stack.add(entry.value);
        }
      }
    }
    return ans;
  }
}

class TrieNode {
  Map<String, TrieNode> children = {};
  int end = -1;
}
