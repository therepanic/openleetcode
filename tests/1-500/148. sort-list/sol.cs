public class Solution {
    public ListNode SortList(ListNode head) {
        var values = new System.Collections.Generic.List<int>();
        while (head != null) {
            values.Add(head.val);
            head = head.next;
        }
        values.Sort();

        var dummy = new ListNode(0);
        var tail = dummy;
        foreach (var value in values) {
            tail.next = new ListNode(value);
            tail = tail.next;
        }
        return dummy.next;
    }
}
