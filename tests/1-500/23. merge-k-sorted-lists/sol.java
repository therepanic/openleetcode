public class Solution {
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists.length == 0) return null;
        return mergeRange(lists, 0, lists.length - 1);
    }

    private ListNode mergeRange(ListNode[] lists, int left, int right) {
        if (left == right) return lists[left];
        int mid = left + (right - left) / 2;
        return mergeTwoLists(mergeRange(lists, left, mid), mergeRange(lists, mid + 1, right));
    }

    private ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        if (list1 == null || list2 == null) return list1 != null ? list1 : list2;
        if (list1.val > list2.val) {
            ListNode tmp = list1;
            list1 = list2;
            list2 = tmp;
        }
        list1.next = mergeTwoLists(list1.next, list2);
        return list1;
    }
}
