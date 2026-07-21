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
    public TreeNode RemoveLeafNodes(TreeNode root, int target) {
        bool TraverseAndRemove(TreeNode temp) {
            if (temp == null) {
                return false;
            }
            if (temp.left == null && temp.right == null) {
                return temp.val != target;
            }
            bool left = TraverseAndRemove(temp.left);
            bool right = TraverseAndRemove(temp.right);
            if (!left) {
                temp.left = null;
            }
            if (!right) {
                temp.right = null;
            }
            return left || right || temp.val != target;
        }
        
        if (!TraverseAndRemove(root)) {
            return null;
        }
        return root;
    }
}
