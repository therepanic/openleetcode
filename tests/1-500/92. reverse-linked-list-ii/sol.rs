impl Solution {
    pub fn reverse_between(
        head: Option<Box<ListNode>>,
        left: i32,
        right: i32,
    ) -> Option<Box<ListNode>> {
        let mut values = ListNode::list_node_to_array(head);
        values[(left - 1) as usize..right as usize].reverse();
        ListNode::to_list_node(values)
    }
}
