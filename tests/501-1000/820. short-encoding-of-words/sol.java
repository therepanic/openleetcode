class Solution {
    public int minimumLengthEncoding(String[] words) {
        Set<String> unique = new HashSet<>(Arrays.asList(words));
        words = unique.toArray(new String[0]);
        TrieNode trie = new TrieNode();
        TrieNode[] nodes = new TrieNode[words.length];
        for (int i = 0; i < words.length; i++) {
            TrieNode node = trie;
            for (int j = words[i].length() - 1; j >= 0; j--) {
                node = node.children.computeIfAbsent(words[i].charAt(j), k -> new TrieNode());
            }
            nodes[i] = node;
        }
        int ans = 0;
        for (int i = 0; i < words.length; i++) {
            if (nodes[i].children.isEmpty()) {
                ans += words[i].length() + 1;
            }
        }
        return ans;
    }
    
    static class TrieNode {
        Map<Character, TrieNode> children = new HashMap<>();
    }
}
