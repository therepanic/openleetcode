def merge_two_lists(list1, list2)
  return list1 || list2 if !list1 || !list2
  if list1.val > list2.val
    list1, list2 = list2, list1
  end
  list1.next = merge_two_lists(list1.next, list2)
  list1
end
