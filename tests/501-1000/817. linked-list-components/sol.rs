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
    pub fn num_components(head: Option<Box<ListNode>>, nums: Vec<i32>) -> i32 {
        use std::collections::HashSet;
        let node_set: HashSet<i32> = nums.into_iter().collect();
        let mut count = 0;
        let mut in_component = false;
        let mut current = head;
        while let Some(node) = current {
            if node_set.contains(&node.val) {
                if !in_component {
                    count += 1;
                    in_component = true;
                }
            } else {
                in_component = false;
            }
            current = node.next;
        }
        count
    }
}
