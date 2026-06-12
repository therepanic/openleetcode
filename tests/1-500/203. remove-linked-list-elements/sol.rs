impl Solution {
    pub fn remove_elements(head: Option<Box<ListNode>>, val: i32) -> Option<Box<ListNode>> {
        let mut dummy = Some(Box::new(ListNode { val: 0, next: head }));
        let mut cur = &mut dummy;
        while let Some(node) = cur {
            while node.next.as_ref().map_or(false, |next| next.val == val) {
                node.next = node.next.take().and_then(|next| next.next);
            }
            cur = &mut node.next;
        }
        dummy.unwrap().next
    }
}
