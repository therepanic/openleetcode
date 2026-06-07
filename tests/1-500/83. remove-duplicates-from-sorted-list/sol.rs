impl Solution {
    pub fn delete_duplicates(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut vals = Vec::new();
        let mut cur = head.as_ref();
        while let Some(node) = cur {
            if vals.last().copied() != Some(node.val) {
                vals.push(node.val);
            }
            cur = node.next.as_ref();
        }
        let mut new_head = None;
        for &v in vals.iter().rev() {
            let mut node = Box::new(ListNode::new(v));
            node.next = new_head;
            new_head = Some(node);
        }
        new_head
    }
}
