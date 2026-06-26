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
    public int[] FindMode(TreeNode root) {
        List<int> lst = new List<int>();
        void Traverse(TreeNode curr) {
            if (curr != null) {
                lst.Add(curr.val);
                Traverse(curr.left);
                Traverse(curr.right);
            }
        }
        Traverse(root);
        Dictionary<int, int> d = new Dictionary<int, int>();
        foreach (int v in lst) {
            if (d.ContainsKey(v)) {
                d[v]++;
            } else {
                d[v] = 1;
            }
        }
        int m = 0;
        foreach (int v in lst) {
            m = Math.Max(m, d[v]);
        }
        HashSet<int> sol = new HashSet<int>();
        foreach (int v in lst) {
            if (d[v] == m) {
                sol.Add(v);
            }
        }
        return sol.ToArray();
    }
}
