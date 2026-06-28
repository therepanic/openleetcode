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
    public TreeNode ConstructMaximumBinaryTree(int[] nums) {
        var stack = new System.Collections.Generic.List<TreeNode>();
        
        foreach (int num in nums) {
            TreeNode current = new TreeNode(num);
            
            while (stack.Count > 0 && stack[stack.Count - 1].val < num) {
                current.left = stack[stack.Count - 1];
                stack.RemoveAt(stack.Count - 1);
            }
            
            if (stack.Count > 0) {
                stack[stack.Count - 1].right = current;
            }
            
            stack.Add(current);
        }
        
        return stack[0];
    }
}
