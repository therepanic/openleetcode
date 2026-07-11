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
    public boolean isCousins(TreeNode root, int x, int y) {
        List<int[]> res = new ArrayList<>();
        Deque<Object[]> stack = new ArrayDeque<>();
        stack.push(new Object[]{root, null, 0});
        while (!stack.isEmpty()) {
            Object[] cur = stack.pop();
            TreeNode curr = (TreeNode) cur[0];
            TreeNode parent = (TreeNode) cur[1];
            int depth = (int) cur[2];
            if (curr.val == x || curr.val == y) {
                res.add(new int[]{parent != null ? parent.val : -1, depth});
            }
            if (curr.left != null) {
                stack.push(new Object[]{curr.left, curr, depth + 1});
            }
            if (curr.right != null) {
                stack.push(new Object[]{curr.right, curr, depth + 1});
            }
        }
        return res.size() == 2 && res.get(0)[1] == res.get(1)[1] && res.get(0)[0] != res.get(1)[0];
    }
}
