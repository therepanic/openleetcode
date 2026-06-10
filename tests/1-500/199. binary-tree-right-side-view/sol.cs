using System.Collections.Generic;

public class Solution {
    public IList<int> RightSideView(TreeNode root) {
        var result = new List<int>();
        if (root == null) {
            return result;
        }

        var queue = new Queue<TreeNode>();
        queue.Enqueue(root);
        while (queue.Count > 0) {
            int levelSize = queue.Count;
            int rightmost = 0;
            for (int i = 0; i < levelSize; i++) {
                TreeNode node = queue.Dequeue();
                rightmost = node.val;
                if (node.left != null) {
                    queue.Enqueue(node.left);
                }
                if (node.right != null) {
                    queue.Enqueue(node.right);
                }
            }
            result.Add(rightmost);
        }
        return result;
    }
}
