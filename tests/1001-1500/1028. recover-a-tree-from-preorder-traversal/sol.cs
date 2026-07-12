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
    public TreeNode RecoverFromPreorder(string traversal) {
        var stack = new System.Collections.Generic.List<TreeNode>();
        TreeNode root = null;
        int i = 0, n = traversal.Length;
        while (i < n) {
            int depth = 0;
            while (i < n && traversal[i] == '-') {
                depth++;
                i++;
            }
            int val = 0;
            while (i < n && char.IsDigit(traversal[i])) {
                val = val * 10 + (traversal[i] - '0');
                i++;
            }
            TreeNode node = new TreeNode(val);
            while (stack.Count > depth) {
                stack.RemoveAt(stack.Count - 1);
            }
            if (stack.Count == 0) {
                root = node;
            } else {
                TreeNode parent = stack[stack.Count - 1];
                if (parent.left == null) {
                    parent.left = node;
                } else {
                    parent.right = node;
                }
            }
            stack.Add(node);
        }
        return root;
    }
}
