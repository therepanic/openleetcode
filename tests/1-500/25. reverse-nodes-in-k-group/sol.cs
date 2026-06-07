public class Solution {
    public ListNode ReverseKGroup(ListNode head, int k) {
        var dummy = new ListNode(0, head);
        var groupPrev = dummy;
        while (true) {
            var kth = GetKthNode(groupPrev, k);
            if (kth == null) break;
            var groupNext = kth.next;
            var prev = groupNext;
            var cur = groupPrev.next;
            while (cur != groupNext) {
                var tmp = cur.next;
                cur.next = prev;
                prev = cur;
                cur = tmp;
            }
            var tmp2 = groupPrev.next;
            groupPrev.next = kth;
            groupPrev = tmp2;
        }
        return dummy.next;
    }

    private ListNode GetKthNode(ListNode start, int k) {
        while (start != null && k > 0) {
            start = start.next;
            k--;
        }
        return start;
    }
}
