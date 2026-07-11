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
    public TreeNode bstFromPreorder(int[] preorder) {
        if (preorder.length == 0) {
            return null;
        }
        return build(preorder, 0, preorder.length - 1);
    }
    
    private TreeNode build(int[] preorder, int start, int end) {
        if (start > end) {
            return null;
        }
        TreeNode root = new TreeNode(preorder[start]);
        int i = start + 1;
        while (i <= end && preorder[i] < root.val) {
            i++;
        }
        root.left = build(preorder, start + 1, i - 1);
        root.right = build(preorder, i, end);
        return root;
    }
}
