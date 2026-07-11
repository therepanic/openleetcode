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
    public TreeNode LcaDeepestLeaves(TreeNode root) {
        return Dfs(root, 0).node;
    }
    
    private (TreeNode node, int depth) Dfs(TreeNode node, int depth) {
        if (node == null) {
            return (null, depth);
        }
        
        var left = Dfs(node.left, depth + 1);
        var right = Dfs(node.right, depth + 1);
        
        if (left.depth > right.depth) {
            return (left.node, left.depth);
        } else if (right.depth > left.depth) {
            return (right.node, right.depth);
        } else {
            return (node, left.depth);
        }
    }
}
