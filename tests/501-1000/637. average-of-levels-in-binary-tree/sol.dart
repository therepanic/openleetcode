class Solution {
  List<double> averageOfLevels(TreeNode? root) {
    if (root == null) return [];

    List<double> res = [];
    List<TreeNode> queue = [root];

    while (queue.isNotEmpty) {
      double levelSum = 0;
      int count = queue.length;

      for (int i = 0; i < count; i++) {
        TreeNode node = queue.removeAt(0);
        levelSum += node.val;
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }

      res.add(levelSum / count);
    }

    return res;
  }
}
