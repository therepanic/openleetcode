public class Solution {
    public boolean isValidBST(TreeNode root) {
        return validate(root, null, null);
    }

    private boolean validate(TreeNode node, Long lower, Long upper) {
        if (node == null) {
            return true;
        }
        long value = node.val;
        if ((lower != null && value <= lower) || (upper != null && value >= upper)) {
            return false;
        }
        return validate(node.left, lower, value) && validate(node.right, value, upper);
    }
}
