/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
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
  bool matches(TreeNode? node, ListNode? current) {
    if (current == null) return true;
    if (node == null || node.val != current.val) return false;
    return matches(node.left, current.next) || matches(node.right, current.next);
  }

  bool isSubPath(ListNode? head, TreeNode? root) {
    if (root == null) return false;
    return matches(root, head) || isSubPath(head, root.left) || isSubPath(head, root.right);
  }
}
