/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int widthOfBinaryTree(TreeNode root) {
        Deque<TreeNode> q = new ArrayDeque<>();
        Deque<Integer> ind = new ArrayDeque<>();
        List<List<Integer>> res = new ArrayList<>();
        q.offer(root);
        ind.offer(0);
        while (!q.isEmpty()) {
            List<Integer> l = new ArrayList<>();
            int size = q.size();
            for (int k = 0; k < size; k++) {
                TreeNode node = q.poll();
                int i = ind.poll();
                if (node != null) {
                    l.add(i);
                    if (node.left != null) {
                        q.offer(node.left);
                        ind.offer(2 * i + 1);
                    }
                    if (node.right != null) {
                        q.offer(node.right);
                        ind.offer(2 * i + 2);
                    }
                }
            }
            res.add(l);
        }
        int max_width = 0;
        for (List<Integer> r : res) {
            if (r.size() >= 1) {
                int width = r.get(r.size() - 1) - r.get(0) + 1;
                max_width = Math.max(max_width, width);
            }
        }
        return max_width;
    }
}
