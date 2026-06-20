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
    public List<String> binaryTreePaths(TreeNode root) {
        List<String> res = new ArrayList<>();
        if (root == null) {
            return res;
        }
        Stack<Object[]> stack = new Stack<>();
        stack.push(new Object[]{root, String.valueOf(root.val)});
        while (!stack.isEmpty()) {
            Object[] pair = stack.pop();
            TreeNode node = (TreeNode) pair[0];
            String path = (String) pair[1];
            if (node.left == null && node.right == null) {
                res.add(path);
            }
            if (node.right != null) {
                stack.push(new Object[]{node.right, path + "->" + node.right.val});
            }
            if (node.left != null) {
                stack.push(new Object[]{node.left, path + "->" + node.left.val});
            }
        }
        return res;
    }
}
