public class Solution {
    public int MinimumLengthEncoding(string[] words) {
        words = new HashSet<string>(words).ToArray();
        var trie = new TrieNode();
        var nodes = new TrieNode[words.Length];
        for (int i = 0; i < words.Length; i++) {
            var node = trie;
            for (int j = words[i].Length - 1; j >= 0; j--) {
                char ch = words[i][j];
                if (!node.Children.ContainsKey(ch)) {
                    node.Children[ch] = new TrieNode();
                }
                node = node.Children[ch];
            }
            nodes[i] = node;
        }
        int ans = 0;
        for (int i = 0; i < words.Length; i++) {
            if (nodes[i].Children.Count == 0) {
                ans += words[i].Length + 1;
            }
        }
        return ans;
    }
    
    private class TrieNode {
        public Dictionary<char, TrieNode> Children = new Dictionary<char, TrieNode>();
    }
}
