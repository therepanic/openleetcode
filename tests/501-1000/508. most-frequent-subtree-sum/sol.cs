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
    public int[] FindFrequentTreeSum(TreeNode root) {
        Dictionary<int, int> c = new Dictionary<int, int>();
        int maxCnt = 0;
        int S(TreeNode n) {
            if (n == null) return 0;
            int r = n.val + S(n.left) + S(n.right);
            if (c.ContainsKey(r)) c[r]++;
            else c[r] = 1;
            if (c[r] > maxCnt) maxCnt = c[r];
            return r;
        }
        S(root);
        List<int> res = new List<int>();
        foreach (var kv in c) {
            if (kv.Value == maxCnt) res.Add(kv.Key);
        }
        return res.ToArray();
    }
}
