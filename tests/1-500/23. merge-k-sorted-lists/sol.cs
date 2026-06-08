public class Solution {
    public ListNode MergeKLists(ListNode[] lists) {
        if (lists.Length == 0) return null;
        return MergeRange(lists, 0, lists.Length - 1);
    }

    private ListNode MergeRange(ListNode[] lists, int left, int right) {
        if (left == right) return lists[left];
        int mid = left + (right - left) / 2;
        return MergeTwoLists(MergeRange(lists, left, mid), MergeRange(lists, mid + 1, right));
    }

    private ListNode MergeTwoLists(ListNode list1, ListNode list2) {
        if (list1 == null || list2 == null) return list1 ?? list2;
        if (list1.val > list2.val) {
            var tmp = list1;
            list1 = list2;
            list2 = tmp;
        }
        list1.next = MergeTwoLists(list1.next, list2);
        return list1;
    }
}
