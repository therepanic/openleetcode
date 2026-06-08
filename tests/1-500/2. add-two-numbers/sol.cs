public class Solution {
    public ListNode AddTwoNumbers(ListNode l1, ListNode l2) {
        var dummy = new ListNode(0);
        var cur = dummy;
        var carry = 0;
        while (l1 != null || l2 != null || carry != 0) {
            var x = l1 != null ? l1.val : 0;
            var y = l2 != null ? l2.val : 0;
            var total = x + y + carry;
            carry = total / 10;
            cur.next = new ListNode(total % 10);
            cur = cur.next;
            l1 = l1 != null ? l1.next : null;
            l2 = l2 != null ? l2.next : null;
        }
        return dummy.next;
    }
}
