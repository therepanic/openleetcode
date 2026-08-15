impl Solution {
    pub fn swap_nodes(head: Option<Box<ListNode>>, k: i32) -> Option<Box<ListNode>> {
        let mut values = Vec::new();
        let mut node = head;
        while let Some(mut current) = node {
            values.push(current.val);
            node = current.next.take();
        }
        if values.len() > 1 {
            let a = (k - 1) as usize;
            let b = values.len() - k as usize;
            values.swap(a, b);
        }
        let mut result = None;
        for value in values.into_iter().rev() {
            result = Some(Box::new(ListNode { val: value, next: result }));
        }
        result
    }
}
