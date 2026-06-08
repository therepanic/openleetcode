List<TreeNode?> generateTrees(int n) {
  if (n == 0) {
    return <TreeNode?>[];
  }
  return _buildTrees(1, n);
}

List<TreeNode?> _buildTrees(int start, int end) {
  if (start > end) {
    return <TreeNode?>[null];
  }

  final result = <TreeNode?>[];
  for (int rootValue = start; rootValue <= end; rootValue++) {
    final leftTrees = _buildTrees(start, rootValue - 1);
    final rightTrees = _buildTrees(rootValue + 1, end);
    for (final left in leftTrees) {
      for (final right in rightTrees) {
        final root = TreeNode(rootValue);
        root.left = left;
        root.right = right;
        result.add(root);
      }
    }
  }

  return result;
}
