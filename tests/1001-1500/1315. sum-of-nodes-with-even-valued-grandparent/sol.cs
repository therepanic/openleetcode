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
    public int SumEvenGrandparent(TreeNode root) {
        var queue = new Queue<(TreeNode node, int parent, int grandparent)>();
        queue.Enqueue((root, -1, -1));
        int res = 0;
        while (queue.Count > 0) {
            var (node, parent, grandparent) = queue.Dequeue();
            if (node == null) continue;
            if (grandparent % 2 == 0) {
                res += node.val;
            }
            if (node.left != null) {
                queue.Enqueue((node.left, node.val, parent));
            }
            if (node.right != null) {
                queue.Enqueue((node.right, node.val, parent));
            }
        }
        return res;
    }
}
