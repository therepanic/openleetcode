impl Solution {
    pub fn partition(head: Option<Box<ListNode>>, x: i32) -> Option<Box<ListNode>> {
        let mut small = Vec::new();
        let mut big = Vec::new();
        let mut cur = head.as_ref();
        while let Some(node) = cur {
            if node.val < x {
                small.push(node.val);
            } else {
                big.push(node.val);
            }
            cur = node.next.as_ref();
        }
        small.extend(big);
        let mut new_head = None;
        for &v in small.iter().rev() {
            let mut node = Box::new(ListNode::new(v));
            node.next = new_head;
            new_head = Some(node);
        }
        new_head
    }
}
