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
    public TreeNode sufficientSubset(TreeNode root, int limit) {
        return dfs(root, 0, limit) ? root : null;
    }
    
    private boolean dfs(TreeNode node, int pathSum, int limit) {
        if (node == null) {
            return false;
        }
        
        int curr = pathSum + node.val;
        
        if (node.left == null && node.right == null) {
            return curr >= limit;
        }
        
        boolean leftGood = dfs(node.left, curr, limit);
        boolean rightGood = dfs(node.right, curr, limit);
        
        if (!leftGood) {
            node.left = null;
        }
        if (!rightGood) {
            node.right = null;
        }
        
        return leftGood || rightGood;
    }
}
