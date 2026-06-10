
public class Solution {
    public bool HasPathSum(TreeNode root, int targetSum) {
        if (root == null) return false;
        if (root.left == null && root.right == null) return root.val == targetSum;
        int remaining = targetSum - root.val;
        return HasPathSum(root.left, remaining) || HasPathSum(root.right, remaining);
    }
}
