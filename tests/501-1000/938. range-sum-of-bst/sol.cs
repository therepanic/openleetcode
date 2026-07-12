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
    public int RangeSumBST(TreeNode root, int low, int high) {
        int res = 0;
        void Dfs(TreeNode node) {
            if (node == null) return;
            Dfs(node.left);
            if (low <= node.val && node.val <= high) {
                res += node.val;
            }
            Dfs(node.right);
        }
        Dfs(root);
        return res;
    }
}
