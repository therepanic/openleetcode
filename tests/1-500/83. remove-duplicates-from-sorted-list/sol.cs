public class Solution {
    public ListNode DeleteDuplicates(ListNode head) {
        var cur = head;
        while (cur != null && cur.next != null) {
            if (cur.val == cur.next.val) cur.next = cur.next.next;
            else cur = cur.next;
        }
        return head;
    }
}
