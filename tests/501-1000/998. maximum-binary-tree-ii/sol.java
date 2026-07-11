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
    public TreeNode insertIntoMaxTree(TreeNode root, int val) {
        return dfs(root, val);
    }
    
    private TreeNode dfs(TreeNode node, int val) {
        if (node == null) {
            return new TreeNode(val);
        }
        if (node.val > val) {
            node.right = dfs(node.right, val);
            return node;
        }
        TreeNode temp = new TreeNode(val);
        temp.left = node;
        return temp;
    }
}
