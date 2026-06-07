impl Solution {
    pub fn reverse_k_group(head: Option<Box<ListNode>>, k: i32) -> Option<Box<ListNode>> {
        let k = k as usize;
        let mut check = head.as_ref();
        for _ in 0..k {
            match check {
                Some(node) => check = node.next.as_ref(),
                None => return head,
            }
        }
        let mut current = head;
        let mut prev = None;
        for _ in 0..k {
            let mut node = current.unwrap();
            current = node.next.take();
            node.next = prev;
            prev = Some(node);
        }
        let rest = Self::reverse_k_group(current, k as i32);
        let mut tail = prev.as_mut().unwrap();
        while tail.next.is_some() {
            tail = tail.next.as_mut().unwrap();
        }
        tail.next = rest;
        prev
    }
}
