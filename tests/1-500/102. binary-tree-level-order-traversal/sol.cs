
public class Solution {
    public System.Collections.Generic.IList<System.Collections.Generic.IList<int>> LevelOrder(TreeNode root) {
        var result = new System.Collections.Generic.List<System.Collections.Generic.IList<int>>();
        if (root == null) return result;
        var queue = new System.Collections.Generic.Queue<TreeNode>();
        queue.Enqueue(root);
        while (queue.Count > 0) {
            int size = queue.Count;
            var level = new System.Collections.Generic.List<int>(size);
            for (int i = 0; i < size; i++) {
                var node = queue.Dequeue();
                level.Add(node.val);
                if (node.left != null) queue.Enqueue(node.left);
                if (node.right != null) queue.Enqueue(node.right);
            }
            result.Add(level);
        }
        return result;
    }
}
