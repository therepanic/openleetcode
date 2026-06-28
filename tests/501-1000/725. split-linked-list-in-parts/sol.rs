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
    pub fn split_list_to_parts(head: Option<Box<ListNode>>, k: i32) -> Vec<Option<Box<ListNode>>> {
        // Step 1: Calculate the length of the linked list
        let mut length = 0;
        let mut current = &head;
        while let Some(node) = current {
            length += 1;
            current = &node.next;
        }
        
        // Step 2: Determine the size of each part
        let part_size = length / k;
        let larger_parts = length % k;
        
        // Initialize a vector to store the results
        let mut result = Vec::with_capacity(k as usize);
        let mut current = head;
        
        // Step 3: Split the linked list into parts
        for i in 0..k {
            let sublist_size = if i < larger_parts { part_size + 1 } else { part_size };
            if sublist_size == 0 {
                result.push(None);
            } else {
                let mut sublist_head = current.take();
                let mut tail = &mut sublist_head;
                for _ in 0..sublist_size - 1 {
                    if let Some(node) = tail {
                        tail = &mut node.next;
                    }
                }
                if let Some(node) = tail {
                    current = node.next.take();
                }
                result.push(sublist_head);
            }
        }
        
        result
    }
}
