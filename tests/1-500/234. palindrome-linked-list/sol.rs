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
    pub fn is_palindrome(head: Option<Box<ListNode>>) -> bool {
        let mut slow = head.as_ref();
        let mut fast = head.as_ref();
        
        // Step 1
        while fast.is_some() && fast.unwrap().next.is_some() {
            fast = fast.unwrap().next.as_ref().unwrap().next.as_ref();
            slow = slow.unwrap().next.as_ref();
        }
        
        // Step 2
        let mut node: Option<Box<ListNode>> = None;
        let mut current = slow.and_then(|n| Some(n.clone()));
        
        while let Some(mut curr) = current {
            let temp = curr.next.take();
            curr.next = node;
            node = Some(curr);
            current = temp;
        }
        
        // Step 3
        let mut first = head.as_ref();
        let mut second = node.as_ref();
        
        while let Some(s) = second {
            if first.unwrap().val != s.val {
                return false;
            }
            first = first.unwrap().next.as_ref();
            second = s.next.as_ref();
        }
        
        true
    }
}
