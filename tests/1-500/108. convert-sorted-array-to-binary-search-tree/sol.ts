function sortedArrayToBST(nums: number[]): TreeNode | null {
  const build = (left: number, right: number): TreeNode | null => {
    if (left > right) return null;
    const mid = left + Math.floor((right - left + 1) / 2);
    const root = new TreeNode(nums[mid]);
    root.left = build(left, mid - 1);
    root.right = build(mid + 1, right);
    return root;
  };
  return build(0, nums.length - 1);
}
