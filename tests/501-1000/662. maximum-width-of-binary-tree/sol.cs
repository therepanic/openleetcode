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
    public int WidthOfBinaryTree(TreeNode root) {
        Queue<TreeNode> q = new Queue<TreeNode>();
        Queue<long> ind = new Queue<long>();
        List<List<long>> res = new List<List<long>>();
        q.Enqueue(root);
        ind.Enqueue(0);
        while (q.Count > 0) {
            List<long> l = new List<long>();
            int size = q.Count;
            for (int k = 0; k < size; k++) {
                TreeNode node = q.Dequeue();
                long i = ind.Dequeue();
                if (node != null) {
                    l.Add(i);
                    if (node.left != null) {
                        q.Enqueue(node.left);
                        ind.Enqueue(2 * i + 1);
                    }
                    if (node.right != null) {
                        q.Enqueue(node.right);
                        ind.Enqueue(2 * i + 2);
                    }
                }
            }
            res.Add(l);
        }
        int maxWidth = 0;
        foreach (var r in res) {
            if (r.Count >= 1) {
                int width = (int)(r[r.Count - 1] - r[0] + 1);
                maxWidth = Math.Max(maxWidth, width);
            }
        }
        return maxWidth;
    }
}
