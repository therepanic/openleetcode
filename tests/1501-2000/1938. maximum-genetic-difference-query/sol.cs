public class Solution {
    private class TrieNode {
        public int count;
        public Dictionary<int, TrieNode> child = new Dictionary<int, TrieNode>();
    }

    private class BitTrie {
        public TrieNode root = new TrieNode();

        public void Increase(int number, int d) {
            TrieNode cur = root;
            for (int i = 17; i >= 0; i--) {
                int bit = (number >> i) & 1;
                if (!cur.child.ContainsKey(bit)) cur.child[bit] = new TrieNode();
                cur = cur.child[bit];
                cur.count += d;
            }
        }

        public int FindMax(int number) {
            TrieNode cur = root;
            int ans = 0;
            for (int i = 17; i >= 0; i--) {
                int bit = (number >> i) & 1;
                int desired = 1 - bit;
                if (cur.child.ContainsKey(desired) && cur.child[desired].count > 0) {
                    cur = cur.child[desired];
                    ans |= (1 << i);
                } else {
                    cur = cur.child[bit];
                }
            }
            return ans;
        }
    }

    public int[] MaxGeneticDifference(int[] parents, int[][] queries) {
        int n = parents.Length;
        List<List<int>> adj = new List<List<int>>();
        for (int i = 0; i < n; i++) adj.Add(new List<int>());
        int root = 0;
        for (int i = 0; i < n; i++) {
            if (parents[i] == -1) root = i;
            else adj[parents[i]].Add(i);
        }

        BitTrie trie = new BitTrie();
        Dictionary<int, List<(int, int)>> qmap = new Dictionary<int, List<(int, int)>>();
        for (int i = 0; i < queries.Length; i++) {
            int node = queries[i][0];
            int val = queries[i][1];
            if (!qmap.ContainsKey(node)) qmap[node] = new List<(int, int)>();
            qmap[node].Add((i, val));
        }

        int[] ans = new int[queries.Length];

        void Dfs(int u) {
            trie.Increase(u, 1);
            if (qmap.ContainsKey(u)) {
                foreach (var (idx, val) in qmap[u]) {
                    ans[idx] = trie.FindMax(val);
                }
            }
            foreach (int v in adj[u]) Dfs(v);
            trie.Increase(u, -1);
        }

        Dfs(root);
        return ans;
    }
}
