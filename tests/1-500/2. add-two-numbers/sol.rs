impl Solution {
    pub fn add_two_numbers(
        mut l1: Option<Box<ListNode>>,
        mut l2: Option<Box<ListNode>>,
    ) -> Option<Box<ListNode>> {
        let mut dummy = Box::new(ListNode::new(0));
        let mut tail = &mut dummy;
        let mut carry = 0;

        while l1.is_some() || l2.is_some() || carry != 0 {
            let x = l1.as_ref().map_or(0, |node| node.val);
            let y = l2.as_ref().map_or(0, |node| node.val);
            let sum = x + y + carry;
            carry = sum / 10;
            tail.next = Some(Box::new(ListNode::new(sum % 10)));
            tail = tail.next.as_mut().unwrap();
            l1 = l1.and_then(|node| node.next);
            l2 = l2.and_then(|node| node.next);
        }

        dummy.next
    }
}
