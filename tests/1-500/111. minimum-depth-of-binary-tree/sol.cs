
public class Solution {
    public int MinDepth(TreeNode root) {
        if (root == null) return 0;
        var queue = new System.Collections.Generic.Queue<System.Tuple<TreeNode, int>>();
        queue.Enqueue(System.Tuple.Create(root, 1));
        while (queue.Count > 0) {
            var item = queue.Dequeue();
            var node = item.Item1;
            int depth = item.Item2;
            if (node.left == null && node.right == null) return depth;
            if (node.left != null) queue.Enqueue(System.Tuple.Create(node.left, depth + 1));
            if (node.right != null) queue.Enqueue(System.Tuple.Create(node.right, depth + 1));
        }
        return 0;
    }
}
