impl Solution {
    pub fn reverse_list(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut current = head;
        let mut prev = None;
        while let Some(mut node) = current {
            current = node.next.take();
            node.next = prev;
            prev = Some(node);
        }
        prev
    }
}
