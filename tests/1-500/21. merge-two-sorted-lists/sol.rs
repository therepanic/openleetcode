impl Solution {
    pub fn merge_two_lists(list1: Option<Box<ListNode>>, list2: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        match (list1, list2) {
            (None, x) => x,
            (x, None) => x,
            (Some(mut a), Some(mut b)) => {
                if a.val <= b.val {
                    let next = a.next.take();
                    a.next = Self::merge_two_lists(next, Some(b));
                    Some(a)
                } else {
                    let next = b.next.take();
                    b.next = Self::merge_two_lists(Some(a), next);
                    Some(b)
                }
            }
        }
    }
}
