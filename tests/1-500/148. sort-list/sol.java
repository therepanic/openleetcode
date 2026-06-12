class Solution {
    public ListNode sortList(ListNode head) {
        java.util.ArrayList<Integer> values = new java.util.ArrayList<>();
        while (head != null) {
            values.add(head.val);
            head = head.next;
        }
        java.util.Collections.sort(values);

        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;
        for (int value : values) {
            tail.next = new ListNode(value);
            tail = tail.next;
        }
        return dummy.next;
    }
}
