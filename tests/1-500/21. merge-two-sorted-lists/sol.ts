function mergeTwoLists(
  list1: ListNode | null,
  list2: ListNode | null,
): ListNode | null {
  if (list1 === null || list2 === null) return list1 ?? list2;
  if (list1.val > list2.val) [list1, list2] = [list2, list1];
  list1.next = mergeTwoLists(list1.next, list2);
  return list1;
}
