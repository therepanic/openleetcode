class Solution {
    public ListNode partition(ListNode head, int x) {
        ListNode smallDummy = new ListNode(0);
        ListNode bigDummy = new ListNode(0);
        ListNode small = smallDummy;
        ListNode big = bigDummy;
        while (head != null) {
            ListNode next = head.next;
            head.next = null;
            if (head.val < x) {
                small.next = head;
                small = small.next;
            } else {
                big.next = head;
                big = big.next;
            }
            head = next;
        }
        small.next = bigDummy.next;
        return smallDummy.next;
    }
}
