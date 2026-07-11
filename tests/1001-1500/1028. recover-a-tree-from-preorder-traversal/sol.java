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
    public TreeNode recoverFromPreorder(String traversal) {
        java.util.ArrayDeque<TreeNode> stack = new java.util.ArrayDeque<>();
        TreeNode root = null;
        int i = 0, n = traversal.length();
        while (i < n) {
            int depth = 0;
            while (i < n && traversal.charAt(i) == '-') {
                depth++;
                i++;
            }
            int val = 0;
            while (i < n && Character.isDigit(traversal.charAt(i))) {
                val = val * 10 + (traversal.charAt(i) - '0');
                i++;
            }
            TreeNode node = new TreeNode(val);
            while (stack.size() > depth) {
                stack.removeLast();
            }
            if (stack.isEmpty()) {
                root = node;
            } else {
                TreeNode parent = stack.peekLast();
                if (parent.left == null) {
                    parent.left = node;
                } else {
                    parent.right = node;
                }
            }
            stack.addLast(node);
        }
        return root;
    }
}
