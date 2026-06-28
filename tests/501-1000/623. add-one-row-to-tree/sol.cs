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
    public TreeNode AddOneRow(TreeNode root, int val, int depth) {
        if (depth == 1) {
            TreeNode newRoot = new TreeNode(val);
            newRoot.left = root;
            return newRoot;
        }
        Construct(root, val, depth, 1);
        return root;
    }
    
    private void Construct(TreeNode temp, int val, int depth, int count) {
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
        Construct(temp.left, val, depth, count + 1);
        Construct(temp.right, val, depth, count + 1);
    }
}
