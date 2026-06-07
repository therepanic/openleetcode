impl Solution {
    pub fn swap_pairs(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        match head {
            Some(mut first) => {
                if let Some(mut second) = first.next.take() {
                    let rest = Self::swap_pairs(second.next.take());
                    first.next = rest;
                    second.next = Some(first);
                    Some(second)
                } else {
                    Some(first)
                }
            }
            None => None,
        }
    }
}
