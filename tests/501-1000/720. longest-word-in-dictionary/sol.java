class Solution {
    public String longestWord(String[] words) {
        TrieNode root = new TrieNode();
        for (int i = 0; i < words.length; i++) {
            TrieNode cur = root;
            for (char ch : words[i].toCharArray()) {
                cur = cur.children.computeIfAbsent(ch, k -> new TrieNode());
            }
            cur.end = i;
        }

        java.util.Stack<TrieNode> stack = new java.util.Stack<>();
        stack.addAll(root.children.values());
        String ans = "";
        while (!stack.isEmpty()) {
            TrieNode cur = stack.pop();
            if (cur.end != -1) {
                String word = words[cur.end];
                if (word.length() > ans.length() || (word.length() == ans.length() && word.compareTo(ans) < 0)) {
                    ans = word;
                }
                for (Map.Entry<Character, TrieNode> entry : cur.children.entrySet()) {
                    stack.push(entry.getValue());
                }
            }
        }
        return ans;
    }

    static class TrieNode {
        Map<Character, TrieNode> children = new HashMap<>();
        int end = -1;
    }
}
