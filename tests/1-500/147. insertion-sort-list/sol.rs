impl Solution {
    pub fn insertion_sort_list(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut values = Vec::new();
        let mut current = head.as_ref();
        while let Some(node) = current {
            values.push(node.val);
            current = node.next.as_ref();
        }
        values.sort();

        let mut result = None;
        for value in values.into_iter().rev() {
            let mut node = Box::new(ListNode::new(value));
            node.next = result;
            result = Some(node);
        }
        result
    }
}
