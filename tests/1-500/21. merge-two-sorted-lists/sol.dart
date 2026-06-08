class Solution {
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
