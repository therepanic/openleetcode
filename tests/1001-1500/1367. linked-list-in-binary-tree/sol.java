/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
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
    private boolean matches(TreeNode node, ListNode current) {
        if (current == null) return true;
        if (node == null || node.val != current.val) return false;
        return matches(node.left, current.next) || matches(node.right, current.next);
    }

    public boolean isSubPath(ListNode head, TreeNode root) {
        if (root == null) return false;
        return matches(root, head) || isSubPath(head, root.left) || isSubPath(head, root.right);
    }
}
