def merge_k_lists(lists)
  return nil if lists.empty?
  merge_range(lists, 0, lists.length - 1)
end

def merge_range(lists, left, right)
  return lists[left] if left == right
  mid = (left + right) / 2
  merge_two_lists(merge_range(lists, left, mid), merge_range(lists, mid + 1, right))
end

def merge_two_lists(list1, list2)
  return list1 || list2 if !list1 || !list2
  if list1.val > list2.val
    list1, list2 = list2, list1
  end
  list1.next = merge_two_lists(list1.next, list2)
  list1
end
