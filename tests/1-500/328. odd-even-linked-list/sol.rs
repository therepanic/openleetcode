impl Solution {
    pub fn odd_even_list(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut vals = Vec::new();
        let mut cur = head;
        while let Some(node) = cur {
            vals.push(node.val);
            cur = node.next;
        }

        let mut reordered = Vec::with_capacity(vals.len());
        for i in (0..vals.len()).step_by(2) {
            reordered.push(vals[i]);
        }
        for i in (1..vals.len()).step_by(2) {
            reordered.push(vals[i]);
        }

        let mut out: Option<Box<ListNode>> = None;
        for &v in reordered.iter().rev() {
            let mut node = Box::new(ListNode::new(v));
            node.next = out;
            out = Some(node);
        }
        out
    }
}
