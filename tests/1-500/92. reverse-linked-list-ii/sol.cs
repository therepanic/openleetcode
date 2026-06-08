public class Solution {
    public ListNode ReverseBetween(ListNode head, int left, int right) {
        var dummy = new ListNode(0, head);
        var prev = dummy;

        for (int i = 1; i < left; i++) {
            prev = prev.next;
        }

        var curr = prev.next;
        for (int i = 0; i < right - left; i++) {
            var node = curr.next;
            curr.next = node.next;
            node.next = prev.next;
            prev.next = node;
        }

        return dummy.next;
    }
}
