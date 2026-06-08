impl Solution {
    pub fn rotate_right(mut head: Option<Box<ListNode>>, k: i32) -> Option<Box<ListNode>> {
        if head.is_none() || head.as_ref().unwrap().next.is_none() || k == 0 {
            return head;
        }

        let mut len = 0usize;
        let mut node = head.as_ref();
        while let Some(current) = node {
            len += 1;
            node = current.next.as_ref();
        }

        let shift = (k as usize) % len;
        if shift == 0 {
            return head;
        }

        let split = len - shift;
        let mut cursor = &mut head;
        for _ in 0..split - 1 {
            cursor = &mut cursor.as_mut().unwrap().next;
        }

        let mut new_head = cursor.as_mut().unwrap().next.take();
        let mut tail = &mut new_head;
        while tail.as_ref().unwrap().next.is_some() {
            tail = &mut tail.as_mut().unwrap().next;
        }
        tail.as_mut().unwrap().next = head;
        new_head
    }
}
