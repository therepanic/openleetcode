impl Solution {
    pub fn remove_zero_sum_sublists(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut values = Vec::new();
        let mut current = head;
        while let Some(mut node) = current {
            values.push(node.val);
            current = node.next.take();
        }

        loop {
            let mut removed = false;
            'outer: for start in 0..values.len() {
                let mut sum = 0;
                for end in start..values.len() {
                    sum += values[end];
                    if sum == 0 {
                        values.drain(start..=end);
                        removed = true;
                        break 'outer;
                    }
                }
            }
            if !removed { break; }
        }

        let mut result = None;
        for value in values.into_iter().rev() {
            let mut node = Box::new(ListNode::new(value));
            node.next = result;
            result = Some(node);
        }
        result
    }
}
