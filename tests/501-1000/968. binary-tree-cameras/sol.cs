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
    public int MinCameraCover(TreeNode root) {
        int Dfs(TreeNode node) {
            if (node == null) return 0;
            int res = Dfs(node.left) + Dfs(node.right);
            int curr = int.MaxValue;
            if (node.left != null) curr = Math.Min(curr, node.left.val);
            if (node.right != null) curr = Math.Min(curr, node.right.val);
            if (curr == 0) {
                node.val = 1;
                res += 1;
            } else if (curr == 1) {
                node.val = 2;
            }
            return res;
        }
        return Dfs(root) + (root.val == 0 ? 1 : 0);
    }
}
