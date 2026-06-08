impl Solution {
    pub fn delete_duplicates(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut vals = Vec::new();
        let mut cur = head.as_ref();
        while let Some(node) = cur {
            vals.push(node.val);
            cur = node.next.as_ref();
        }
        let mut filtered = Vec::new();
        let mut i = 0usize;
        while i < vals.len() {
            let mut j = i + 1;
            while j < vals.len() && vals[j] == vals[i] {
                j += 1;
            }
            if j == i + 1 {
                filtered.push(vals[i]);
            }
            i = j;
        }
        let mut new_head = None;
        for &v in filtered.iter().rev() {
            let mut node = Box::new(ListNode::new(v));
            node.next = new_head;
            new_head = Some(node);
        }
        new_head
    }
}
