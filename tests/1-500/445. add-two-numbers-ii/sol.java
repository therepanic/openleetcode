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
class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        StringBuilder s1 = new StringBuilder();
        while (l1 != null) {
            s1.append(l1.val);
            l1 = l1.next;
        }

        StringBuilder s2 = new StringBuilder();
        while (l2 != null) {
            s2.append(l2.val);
            l2 = l2.next;
        }

        java.math.BigInteger n1 = new java.math.BigInteger(s1.toString());
        java.math.BigInteger n2 = new java.math.BigInteger(s2.toString());
        String r = n1.add(n2).toString();

        ListNode dummy = new ListNode(0);
        ListNode cur = dummy;

        for (char x : r.toCharArray()) {
            cur.next = new ListNode(x - '0');
            cur = cur.next;
        }

        return dummy.next;
    }
}
