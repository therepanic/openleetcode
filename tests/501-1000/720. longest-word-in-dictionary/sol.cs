public class Solution {
    public string LongestWord(string[] words) {
        TrieNode root = new TrieNode();
        for (int i = 0; i < words.Length; i++) {
            TrieNode cur = root;
            foreach (char ch in words[i]) {
                if (!cur.children.ContainsKey(ch)) {
                    cur.children[ch] = new TrieNode();
                }
                cur = cur.children[ch];
            }
            cur.end = i;
        }

        Stack<TrieNode> stack = new Stack<TrieNode>();
        foreach (var node in root.children.Values) {
            stack.Push(node);
        }
        string ans = "";
        while (stack.Count > 0) {
            TrieNode cur = stack.Pop();
            if (cur.end != -1) {
                string word = words[cur.end];
                if (word.Length > ans.Length || (word.Length == ans.Length && string.Compare(word, ans) < 0)) {
                    ans = word;
                }
                foreach (var node in cur.children.Values) {
                    stack.Push(node);
                }
            }
        }
        return ans;
    }

    class TrieNode {
        public Dictionary<char, TrieNode> children = new Dictionary<char, TrieNode>();
        public int end = -1;
    }
}
