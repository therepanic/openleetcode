public class Solution {
    public ListNode Partition(ListNode head, int x) {
        var smallDummy = new ListNode(0);
        var bigDummy = new ListNode(0);
        var small = smallDummy;
        var big = bigDummy;
        while (head != null) {
            var next = head.next;
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
