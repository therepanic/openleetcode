class Solution {
  int minimumLengthEncoding(List<String> words) {
    words = words.toSet().toList();
    var trie = TrieNode();
    var nodes = <TrieNode>[];
    for (var word in words) {
      var node = trie;
      for (var i = word.length - 1; i >= 0; i--) {
        node = node.children.putIfAbsent(word[i], () => TrieNode());
      }
      nodes.add(node);
    }
    var ans = 0;
    for (var i = 0; i < words.length; i++) {
      if (nodes[i].children.isEmpty) {
        ans += words[i].length + 1;
      }
    }
    return ans;
  }
}

class TrieNode {
  Map<String, TrieNode> children = {};
}
