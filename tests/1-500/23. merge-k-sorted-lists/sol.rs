impl Solution {
    pub fn merge_k_lists(lists: Vec<Option<Box<ListNode>>>) -> Option<Box<ListNode>> {
        if lists.is_empty() { return None; }
        Self::merge_range(lists)
    }

    fn merge_range(mut lists: Vec<Option<Box<ListNode>>>) -> Option<Box<ListNode>> {
        if lists.len() == 1 {
            return lists.pop().unwrap();
        }
        let mid = lists.len() / 2;
        let right = lists.split_off(mid);
        let left = lists;
        Self::merge_two_lists(Self::merge_range(left), Self::merge_range(right))
    }

    fn merge_two_lists(list1: Option<Box<ListNode>>, list2: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
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
