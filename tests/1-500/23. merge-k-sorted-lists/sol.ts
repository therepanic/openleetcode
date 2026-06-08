function mergeKLists(lists: Array<ListNode | null>): ListNode | null {
  if (lists.length === 0) return null;
  return mergeRange(lists, 0, lists.length - 1);
}

function mergeRange(
  lists: Array<ListNode | null>,
  left: number,
  right: number,
): ListNode | null {
  if (left === right) return lists[left];
  const mid = left + Math.floor((right - left) / 2);
  return mergeTwoLists(
    mergeRange(lists, left, mid),
    mergeRange(lists, mid + 1, right),
  );
}

function mergeTwoLists(
  list1: ListNode | null,
  list2: ListNode | null,
): ListNode | null {
  if (list1 === null || list2 === null) return list1 ?? list2;
  if (list1.val > list2.val) {
    const tmp = list1;
    list1 = list2;
    list2 = tmp;
  }
  list1.next = mergeTwoLists(list1.next, list2);
  return list1;
}
