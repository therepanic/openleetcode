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
    public TreeNode ConstructFromPrePost(int[] preorder, int[] postorder) {
        int index = 0;
        return Construct(preorder, postorder, ref index, 0, preorder.Length - 1);
    }
    
    private TreeNode Construct(int[] pre, int[] post, ref int index, int l, int h) {
        if (index >= pre.Length || l > h) {
            return null;
        }
        
        TreeNode root = new TreeNode(pre[index]);
        index++;
        if (l == h) {
            return root;
        }
        
        int i = l;
        while (i <= h && post[i] != pre[index]) {
            i++;
        }
        
        if (i <= h) {
            root.left = Construct(pre, post, ref index, l, i);
            root.right = Construct(pre, post, ref index, i + 1, h - 1);
        }
        
        return root;
    }
}
