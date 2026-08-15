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
    public boolean isEvenOddTree(TreeNode root) {
        List<List<Integer>> elements = new ArrayList<>();
        elements.add(new ArrayList<>());
        return collect(root, 0, elements);
    }
    
    private boolean collect(TreeNode temp, int pos, List<List<Integer>> elements) {
        if (temp == null) return true;
        if (elements.size() == pos) elements.add(new ArrayList<>());
        int posCheck = pos % 2;
        int valCheck = temp.val % 2;
        if (posCheck == 0 && valCheck != 0) {
            if (!elements.get(pos).isEmpty() && !(elements.get(pos).get(elements.get(pos).size() - 1) < temp.val)) return false;
            elements.get(pos).add(temp.val);
        } else if (posCheck != 0 && valCheck == 0) {
            if (!elements.get(pos).isEmpty() && !(elements.get(pos).get(elements.get(pos).size() - 1) > temp.val)) return false;
            elements.get(pos).add(temp.val);
        } else {
            return false;
        }
        return collect(temp.left, pos + 1, elements) && collect(temp.right, pos + 1, elements);
    }
}
