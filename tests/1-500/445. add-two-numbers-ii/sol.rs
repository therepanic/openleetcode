// Definition for singly-linked list.
// #[derive(PartialEq, Eq, Clone, Debug)]
// pub struct ListNode {
//   pub val: i32,
//   pub next: Option<Box<ListNode>>
// }
// 
// impl ListNode {
//   #[inline]
//   fn new(val: i32) -> Self {
//     ListNode {
//       next: None,
//       val
//     }
//   }
// }
impl Solution {
    pub fn add_two_numbers(l1: Option<Box<ListNode>>, l2: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut s1 = Vec::new();
        let mut p = &l1;
        while let Some(node) = p {
            s1.push(node.val);
            p = &node.next;
        }

        let mut s2 = Vec::new();
        let mut q = &l2;
        while let Some(node) = q {
            s2.push(node.val);
            q = &node.next;
        }

        let mut carry = 0;
        let mut head = None;
        while !s1.is_empty() || !s2.is_empty() || carry > 0 {
            let mut sum = carry;
            if let Some(val) = s1.pop() {
                sum += val;
            }
            if let Some(val) = s2.pop() {
                sum += val;
            }
            let mut node = Box::new(ListNode::new(sum % 10));
            node.next = head;
            head = Some(node);
            carry = sum / 10;
        }

        while matches!(head.as_ref(), Some(node) if node.val == 0 && node.next.is_some()) {
            head = head.and_then(|node| node.next);
        }

        head
    }
}
