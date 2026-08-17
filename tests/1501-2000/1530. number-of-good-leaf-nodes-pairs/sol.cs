/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
public class Solution {
    public int CountPairs(TreeNode root, int distance) {
        var graph = new Dictionary<TreeNode, List<TreeNode>>();
        void Dfs(TreeNode node, TreeNode parent) {
            if (node == null) return;
            if (parent != null) {
                if (!graph.ContainsKey(parent)) graph[parent] = new List<TreeNode>();
                if (!graph.ContainsKey(node)) graph[node] = new List<TreeNode>();
                graph[parent].Add(node);
                graph[node].Add(parent);
            }
            Dfs(node.left, node);
            Dfs(node.right, node);
        }
        Dfs(root, null);

        var leaves = new List<TreeNode>();
        foreach (var node in graph.Keys) {
            if (node.left == null && node.right == null) leaves.Add(node);
        }

        int ans = 0;
        for (int i = 0; i < leaves.Count; i++) {
            var leaf = leaves[i];
            var q = new Queue<(TreeNode, int)>();
            var visited = new HashSet<TreeNode>();
            q.Enqueue((leaf, 0));
            visited.Add(leaf);

            while (q.Count > 0) {
                var (node, dist) = q.Dequeue();
                if (dist >= distance) continue;
                foreach (var nei in graph[node]) {
                    if (!visited.Contains(nei)) {
                        visited.Add(nei);
                        q.Enqueue((nei, dist + 1));
                        if (nei.left == null && nei.right == null && leaves.IndexOf(nei) > i) {
                            ans++;
                        }
                    }
                }
            }
        }
        return ans;
    }
}
