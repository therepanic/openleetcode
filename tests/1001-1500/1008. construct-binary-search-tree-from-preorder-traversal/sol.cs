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
    public TreeNode BstFromPreorder(int[] preorder) {
        if (preorder.Length == 0) {
            return null;
        }
        return Build(preorder, 0, preorder.Length - 1);
    }
    
    private TreeNode Build(int[] preorder, int start, int end) {
        if (start > end) {
            return null;
        }
        TreeNode root = new TreeNode(preorder[start]);
        int i = start + 1;
        while (i <= end && preorder[i] < root.val) {
            i++;
        }
        root.left = Build(preorder, start + 1, i - 1);
        root.right = Build(preorder, i, end);
        return root;
    }
}
