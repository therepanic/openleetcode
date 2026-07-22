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
    public int GoodNodes(TreeNode root) {
        int Dfs(TreeNode node, int maxSoFar) {
            if (node == null) return 0;
            int count = node.val >= maxSoFar ? 1 : 0;
            int newMax = Math.Max(maxSoFar, node.val);
            count += Dfs(node.left, newMax);
            count += Dfs(node.right, newMax);
            return count;
        }
        return Dfs(root, root.val);
    }
}
