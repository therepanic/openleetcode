public class Solution {
    public bool IsValidBST(TreeNode root) {
        return Validate(root, null, null);
    }

    private bool Validate(TreeNode node, long? lower, long? upper) {
        if (node == null) {
            return true;
        }
        long value = node.val;
        if ((lower.HasValue && value <= lower.Value) ||
            (upper.HasValue && value >= upper.Value)) {
            return false;
        }
        return Validate(node.left, lower, value) && Validate(node.right, value, upper);
    }
}
