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
    public TreeNode addOneRow(TreeNode root, int val, int depth) {
        if (depth == 1) {
            TreeNode newRoot = new TreeNode(val);
            newRoot.left = root;
            return newRoot;
        }
        construct(root, val, depth, 1);
        return root;
    }
    
    private void construct(TreeNode temp, int val, int depth, int count) {
        if (temp == null) {
            return;
        }
        if (count == depth - 1) {
            TreeNode newLeft = new TreeNode(val);
            newLeft.left = temp.left;
            temp.left = newLeft;
            
            TreeNode newRight = new TreeNode(val);
            newRight.right = temp.right;
            temp.right = newRight;
            return;
        }
        construct(temp.left, val, depth, count + 1);
        construct(temp.right, val, depth, count + 1);
    }
}
