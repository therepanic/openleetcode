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
    public TreeNode PruneTree(TreeNode root) {
        traverseAndRemove(root);
        if (root.left == null && root.right == null && root.val == 0) {
            return null;
        }
        return root;
    }
    
    private bool traverseAndRemove(TreeNode temp) {
        if (temp == null) {
            return false;
        }
        if (temp.left == null && temp.right == null) {
            return temp.val == 1;
        }
        bool left = traverseAndRemove(temp.left);
        bool right = traverseAndRemove(temp.right);
        if (!left) {
            temp.left = null;
        }
        if (!right) {
            temp.right = null;
        }
        return left || right || temp.val == 1;
    }
}
