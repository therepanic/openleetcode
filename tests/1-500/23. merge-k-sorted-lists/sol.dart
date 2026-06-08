class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.isEmpty) return null;
    return _mergeRange(lists, 0, lists.length - 1);
  }

  ListNode? _mergeRange(List<ListNode?> lists, int left, int right) {
    if (left == right) return lists[left];
    final mid = left + (right - left) ~/ 2;
    return mergeTwoLists(_mergeRange(lists, left, mid), _mergeRange(lists, mid + 1, right));
  }

  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    if (list1 == null || list2 == null) return list1 ?? list2;
    if (list1.val > list2.val) {
      final tmp = list1;
      list1 = list2;
      list2 = tmp;
    }
    list1.next = mergeTwoLists(list1.next, list2);
    return list1;
  }
}
