/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
public class Solution {
    private int FindHeight(TreeNode node) {
        if (node == null) return 0;
        int height = 0;
        if (node.left != null) {
            height = Math.Max(height, 1 + FindHeight(node.left));
        }
        if (node.right != null) {
            height = Math.Max(height, 1 + FindHeight(node.right));
        }
        return height;
    }

    public IList<IList<string>> PrintTree(TreeNode root) {
        int height = FindHeight(root);
        int m = height + 1;
        int n = (1 << (height + 1)) - 1;
        IList<IList<string>> matrix = new List<IList<string>>();
        for (int i = 0; i < m; i++) {
            List<string> row = new List<string>();
            for (int j = 0; j < n; j++) {
                row.Add("");
            }
            matrix.Add(row);
        }
        Queue<(TreeNode, int, int)> queue = new Queue<(TreeNode, int, int)>();
        queue.Enqueue((root, 0, (n - 1) / 2));
        while (queue.Count > 0) {
            int levelSize = queue.Count;
            for (int i = 0; i < levelSize; i++) {
                var (frontNode, x, y) = queue.Dequeue();
                matrix[x][y] = frontNode.val.ToString();
                if (frontNode.left != null) {
                    queue.Enqueue((frontNode.left, x + 1, y - (1 << (height - x - 1))));
                }
                if (frontNode.right != null) {
                    queue.Enqueue((frontNode.right, x + 1, y + (1 << (height - x - 1))));
                }
            }
        }
        return matrix;
    }
}
