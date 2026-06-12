
class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {
    TreeNode? build(int left, int right) {
      if (left > right) return null;
      final mid = left + ((right - left + 1) >> 1);
      final root = TreeNode(nums[mid]);
      root.left = build(left, mid - 1);
      root.right = build(mid + 1, right);
      return root;
    }
    return build(0, nums.length - 1);
  }
}
