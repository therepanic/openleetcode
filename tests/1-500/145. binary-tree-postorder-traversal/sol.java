class Solution {
    public java.util.List<Integer> postorderTraversal(TreeNode root) {
        java.util.List<Integer> result = new java.util.ArrayList<>();
        if (root == null) return result;

        java.util.ArrayDeque<TreeNode> stack = new java.util.ArrayDeque<>();
        stack.push(root);
        while (!stack.isEmpty()) {
            TreeNode node = stack.pop();
            result.add(node.val);
            if (node.left != null) stack.push(node.left);
            if (node.right != null) stack.push(node.right);
        }
        java.util.Collections.reverse(result);
        return result;
    }
}
