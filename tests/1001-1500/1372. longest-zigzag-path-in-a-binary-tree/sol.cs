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
    public int LongestZigZag(TreeNode root) {
        if (root == null) return 0;
        int best = 0;
        Stack<(TreeNode node, int endedLeft, int endedRight)> stack = new Stack<(TreeNode, int, int)>();
        stack.Push((root, 0, 0));
        while (stack.Count > 0) {
            var (node, endedLeft, endedRight) = stack.Pop();
            best = Math.Max(best, Math.Max(endedLeft, endedRight));
            if (node.left != null) {
                stack.Push((node.left, endedRight + 1, 0));
            }
            if (node.right != null) {
                stack.Push((node.right, 0, endedLeft + 1));
            }
        }
        return best;
    }
}
