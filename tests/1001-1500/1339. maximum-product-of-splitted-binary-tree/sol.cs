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
    public int MaxProduct(TreeNode root) {
        const int MOD = 1_000_000_007;
        var nodes = new List<TreeNode>();
        var stack = new Stack<TreeNode>();
        stack.Push(root);

        while (stack.Count > 0) {
            TreeNode node = stack.Pop();
            if (node != null) {
                nodes.Add(node);
                stack.Push(node.left);
                stack.Push(node.right);
            }
        }

        var sums = new Dictionary<TreeNode, long>();
        for (int i = nodes.Count - 1; i >= 0; i--) {
            TreeNode node = nodes[i];
            long sub = node.val;
            if (node.left != null) sub += sums[node.left];
            if (node.right != null) sub += sums[node.right];
            sums[node] = sub;
        }

        long total = sums[root];
        long best = 0;
        foreach (long sub in sums.Values) {
            best = Math.Max(best, sub * (total - sub));
        }
        return (int)(best % MOD);
    }
}
