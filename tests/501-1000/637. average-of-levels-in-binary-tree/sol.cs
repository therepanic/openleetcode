public class Solution {
    public IList<double> AverageOfLevels(TreeNode root) {
        if (root == null) return new List<double>();

        IList<double> res = new List<double>();
        Queue<TreeNode> queue = new Queue<TreeNode>();
        queue.Enqueue(root);

        while (queue.Count > 0) {
            double levelSum = 0;
            int count = queue.Count;

            for (int i = 0; i < count; i++) {
                TreeNode node = queue.Dequeue();
                levelSum += node.val;
                if (node.left != null) queue.Enqueue(node.left);
                if (node.right != null) queue.Enqueue(node.right);
            }

            res.Add(levelSum / count);
        }

        return res;
    }
}
