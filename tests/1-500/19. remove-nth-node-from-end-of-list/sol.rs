impl Solution {
    pub fn remove_nth_from_end(head: Option<Box<ListNode>>, n: i32) -> Option<Box<ListNode>> {
        let mut len = 0usize;
        let mut p = head.as_ref();
        while let Some(node) = p {
            len += 1;
            p = node.next.as_ref();
        }
        let mut dummy = Box::new(ListNode { val: 0, next: head });
        let mut cur = &mut dummy;
        for _ in 0..(len - n as usize) {
            cur = cur.next.as_mut().unwrap();
        }
        let next = cur.next.as_mut().unwrap().next.take();
        cur.next = next;
        dummy.next
    }
}
