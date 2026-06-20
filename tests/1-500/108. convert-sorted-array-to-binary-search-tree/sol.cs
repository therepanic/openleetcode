
public class Solution {
    public TreeNode SortedArrayToBST(int[] nums) {
        return Build(nums, 0, nums.Length - 1);
    }

    private TreeNode Build(int[] nums, int left, int right) {
        if (left > right) return null;
        int mid = left + (right - left + 1) / 2;
        var root = new TreeNode(nums[mid]);
        root.left = Build(nums, left, mid - 1);
        root.right = Build(nums, mid + 1, right);
        return root;
    }
}
