/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public boolean isSubtree(TreeNode root, TreeNode subRoot) {
        String r = ser(root);
        String s = ser(subRoot);
        return r.contains(s);
    }
    
    private String ser(TreeNode n) {
        if (n == null) {
            return ",#";
        }
        return "," + n.val + ser(n.left) + ser(n.right);
    }
}
