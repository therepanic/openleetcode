/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  bool isEvenOddTree(TreeNode? root) {
    List<List<int>> elements = [[]];
    bool collect(TreeNode? temp, int pos) {
      if (temp == null) return true;
      if (elements.length == pos) elements.add([]);
      int posCheck = pos % 2;
      int valCheck = temp.val % 2;
      if (posCheck == 0 && valCheck != 0) {
        if (elements[pos].isNotEmpty && !(elements[pos].last < temp.val)) return false;
        elements[pos].add(temp.val);
      } else if (posCheck != 0 && valCheck == 0) {
        if (elements[pos].isNotEmpty && !(elements[pos].last > temp.val)) return false;
        elements[pos].add(temp.val);
      } else {
        return false;
      }
      return collect(temp.left, pos + 1) && collect(temp.right, pos + 1);
    }
    return collect(root, 0);
  }
}
