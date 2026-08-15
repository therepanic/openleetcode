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
    public bool IsEvenOddTree(TreeNode root) {
        var elements = new List<List<int>> { new List<int>() };
        bool Collect(TreeNode temp, int pos) {
            if (temp == null) return true;
            if (elements.Count == pos) elements.Add(new List<int>());
            int posCheck = pos % 2;
            int valCheck = temp.val % 2;
            if (posCheck == 0 && valCheck != 0) {
                if (elements[pos].Count > 0 && !(elements[pos][elements[pos].Count - 1] < temp.val)) return false;
                elements[pos].Add(temp.val);
            } else if (posCheck != 0 && valCheck == 0) {
                if (elements[pos].Count > 0 && !(elements[pos][elements[pos].Count - 1] > temp.val)) return false;
                elements[pos].Add(temp.val);
            } else {
                return false;
            }
            return Collect(temp.left, pos + 1) && Collect(temp.right, pos + 1);
        }
        return Collect(root, 0);
    }
}
