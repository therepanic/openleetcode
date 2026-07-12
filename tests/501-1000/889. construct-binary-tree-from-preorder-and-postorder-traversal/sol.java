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
    public TreeNode constructFromPrePost(int[] preorder, int[] postorder) {
        int[] index = new int[]{0};
        return construct(preorder, postorder, index, 0, preorder.length - 1);
    }
    
    private TreeNode construct(int[] pre, int[] post, int[] index, int l, int h) {
        if (index[0] >= pre.length || l > h) {
            return null;
        }
        
        TreeNode root = new TreeNode(pre[index[0]]);
        index[0]++;
        if (l == h) {
            return root;
        }
        
        int i = l;
        while (i <= h && post[i] != pre[index[0]]) {
            i++;
        }
        
        if (i <= h) {
            root.left = construct(pre, post, index, l, i);
            root.right = construct(pre, post, index, i + 1, h - 1);
        }
        
        return root;
    }
}
