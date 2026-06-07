class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    final result = <int>[];

    void traverse(TreeNode? node) {
      if (node == null) {
        return;
      }
      traverse(node.left);
      result.add(node.val);
      traverse(node.right);
    }

    traverse(root);
    return result;
  }
}
