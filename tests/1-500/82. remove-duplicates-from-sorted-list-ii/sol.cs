public class Solution {
    public ListNode DeleteDuplicates(ListNode head) {
        var dummy = new ListNode(0, head);
        var prev = dummy;
        var cur = head;
        while (cur != null) {
            bool dup = false;
            while (cur.next != null && cur.val == cur.next.val) {
                dup = true;
                cur = cur.next;
            }
            if (dup) prev.next = cur.next;
            else prev = prev.next;
            cur = cur.next;
        }
        return dummy.next;
    }
}
