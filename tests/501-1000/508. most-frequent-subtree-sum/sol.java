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
    public int[] findFrequentTreeSum(TreeNode root) {
        java.util.Map<Integer, Integer> c = new java.util.HashMap<>();
        int[] max = new int[1];
        s(root, c, max);
        java.util.List<Integer> res = new java.util.ArrayList<>();
        for (java.util.Map.Entry<Integer, Integer> e : c.entrySet()) {
            if (e.getValue() == max[0]) {
                res.add(e.getKey());
            }
        }
        int[] ans = new int[res.size()];
        for (int i = 0; i < res.size(); i++) {
            ans[i] = res.get(i);
        }
        return ans;
    }
    
    private int s(TreeNode n, java.util.Map<Integer, Integer> c, int[] max) {
        if (n == null) return 0;
        int r = n.val + s(n.left, c, max) + s(n.right, c, max);
        c.put(r, c.getOrDefault(r, 0) + 1);
        if (c.get(r) > max[0]) {
            max[0] = c.get(r);
        }
        return r;
    }
}
