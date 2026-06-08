class Solution {
  bool isValidBST(TreeNode? root) {
    bool validate(TreeNode? node, int? lower, int? upper) {
      if (node == null) {
        return true;
      }
      if ((lower != null && node.val <= lower) ||
          (upper != null && node.val >= upper)) {
        return false;
      }
      return validate(node.left, lower, node.val) &&
          validate(node.right, node.val, upper);
    }

    return validate(root, null, null);
  }
}
