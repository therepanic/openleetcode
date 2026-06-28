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
    public int[] findMode(TreeNode root) {
        List<Integer> lst = new ArrayList<>();
        traverse(root, lst);
        Map<Integer, Integer> d = new HashMap<>();
        for (int v : lst) {
            d.put(v, d.getOrDefault(v, 0) + 1);
        }
        int m = 0;
        for (int v : lst) {
            m = Math.max(m, d.get(v));
        }
        Set<Integer> sol = new HashSet<>();
        for (int v : lst) {
            if (d.get(v) == m) {
                sol.add(v);
            }
        }
        int[] res = new int[sol.size()];
        int i = 0;
        for (int v : sol) {
            res[i++] = v;
        }
        return res;
    }
    private void traverse(TreeNode curr, List<Integer> lst) {
        if (curr != null) {
            lst.add(curr.val);
            traverse(curr.left, lst);
            traverse(curr.right, lst);
        }
    }
}
