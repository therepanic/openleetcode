/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public int val;
 *     public ListNode next;
 *     public ListNode(int val=0, ListNode next=null) {
 *         this.val = val;
 *         this.next = next;
 *     }
 * }
 */
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
    private bool Matches(TreeNode node, ListNode current) {
        if (current == null) return true;
        if (node == null || node.val != current.val) return false;
        return Matches(node.left, current.next) || Matches(node.right, current.next);
    }

    public bool IsSubPath(ListNode head, TreeNode root) {
        if (root == null) return false;
        return Matches(root, head) || IsSubPath(head, root.left) || IsSubPath(head, root.right);
    }
}
