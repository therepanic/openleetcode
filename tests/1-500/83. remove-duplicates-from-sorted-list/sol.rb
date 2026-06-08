def delete_duplicates(head)
  cur = head
  while cur && cur.next
    if cur.val == cur.next.val
      cur.next = cur.next.next
    else
      cur = cur.next
    end
  end
  head
end
