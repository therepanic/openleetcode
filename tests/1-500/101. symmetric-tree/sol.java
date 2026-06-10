
class Solution {
    public boolean isSymmetric(TreeNode root) {
        return root == null || mirror(root.left, root.right);
    }

    private boolean mirror(TreeNode left, TreeNode right) {
        if (left == null || right == null) return left == right;
        return left.val == right.val
            && mirror(left.left, right.right)
            && mirror(left.right, right.left);
    }
}
