
public class Solution {
    public bool IsSymmetric(TreeNode root) {
        return root == null || Mirror(root.left, root.right);
    }

    private bool Mirror(TreeNode left, TreeNode right) {
        if (left == null || right == null) return left == right;
        return left.val == right.val
            && Mirror(left.left, right.right)
            && Mirror(left.right, right.left);
    }
}
