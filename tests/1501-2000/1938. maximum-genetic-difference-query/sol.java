import java.util.*;

class Solution {
    class TrieNode {
        int count = 0;
        Map<Integer, TrieNode> child = new HashMap<>();
    }

    class BitTrie {
        TrieNode root = new TrieNode();

        void increase(int number, int d) {
            TrieNode cur = root;
            for (int i = 17; i >= 0; i--) {
                int bit = (number >> i) & 1;
                cur.child.computeIfAbsent(bit, k -> new TrieNode());
                cur = cur.child.get(bit);
                cur.count += d;
            }
        }

        int findMax(int number) {
            TrieNode cur = root;
            int ans = 0;
            for (int i = 17; i >= 0; i--) {
                int bit = (number >> i) & 1;
                int desired = 1 - bit;
                if (cur.child.containsKey(desired) && cur.child.get(desired).count > 0) {
                    cur = cur.child.get(desired);
                    ans |= (1 << i);
                } else {
                    cur = cur.child.get(bit);
                }
            }
            return ans;
        }
    }

    public int[] maxGeneticDifference(int[] parents, int[][] queries) {
        int n = parents.length;
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < n; i++) adj.add(new ArrayList<>());
        int root = 0;
        for (int i = 0; i < n; i++) {
            if (parents[i] == -1) root = i;
            else adj.get(parents[i]).add(i);
        }

        BitTrie trie = new BitTrie();
        Map<Integer, List<int[]>> qmap = new HashMap<>();
        for (int i = 0; i < queries.length; i++) {
            qmap.computeIfAbsent(queries[i][0], k -> new ArrayList<>()).add(new int[]{i, queries[i][1]});
        }

        int[] ans = new int[queries.length];

        dfs(root, adj, trie, qmap, ans);
        return ans;
    }

    private void dfs(int u, List<List<Integer>> adj, BitTrie trie, Map<Integer, List<int[]>> qmap, int[] ans) {
        trie.increase(u, 1);
        if (qmap.containsKey(u)) {
            for (int[] p : qmap.get(u)) {
                ans[p[0]] = trie.findMax(p[1]);
            }
        }
        for (int v : adj.get(u)) {
            dfs(v, adj, trie, qmap, ans);
        }
        trie.increase(u, -1);
    }
}
