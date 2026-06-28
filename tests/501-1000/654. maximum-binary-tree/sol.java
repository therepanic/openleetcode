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
    public TreeNode constructMaximumBinaryTree(int[] nums) {
        java.util.Deque<TreeNode> stack = new java.util.ArrayDeque<>();
        
        for (int num : nums) {
            TreeNode current = new TreeNode(num);
            
            while (!stack.isEmpty() && stack.peekLast().val < num) {
                current.left = stack.pollLast();
            }
            
            if (!stack.isEmpty()) {
                stack.peekLast().right = current;
            }
            
            stack.offerLast(current);
        }
        
        return stack.peekFirst();
    }
}
