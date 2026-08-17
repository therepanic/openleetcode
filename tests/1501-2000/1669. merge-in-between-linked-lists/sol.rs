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
    pub fn merge_in_between(list1: Option<Box<ListNode>>, a: i32, b: i32, list2: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        let mut first = Vec::new();
        let mut cur = list1;
        while let Some(mut node) = cur {
            cur = node.next.take();
            first.push(node);
        }
        let mut middle = Vec::new();
        let mut cur = list2;
        while let Some(mut node) = cur {
            cur = node.next.take();
            middle.push(node);
        }
        let suffix = first.split_off((b + 1) as usize);
        first.truncate(a as usize);
        let mut result = Vec::new();
        result.extend(first);
        result.extend(middle);
        result.extend(suffix);
        let mut head = None;
        for mut node in result.into_iter().rev() {
            node.next = head;
            head = Some(node);
        }
        head
    }
}
