// Definition for a binary tree node.
// #[derive(Debug, PartialEq, Eq)]
// pub struct TreeNode {
//   pub val: i32,
//   pub left: Option<Rc<RefCell<TreeNode>>>,
//   pub right: Option<Rc<RefCell<TreeNode>>>,
// }
// 
// impl TreeNode {
//   #[inline]
//   pub fn new(val: i32) -> Self {
//     TreeNode {
//       val,
//       left: None,
//       right: None
//     }
//   }
// }
use std::collections::VecDeque;

impl Solution {
    pub fn smallest_from_leaf(root: Option<Rc<RefCell<TreeNode>>>) -> String {
        let mut smallest_string = String::new();
        let mut node_queue: VecDeque<(Rc<RefCell<TreeNode>>, String)> = VecDeque::new();
        
        if let Some(node) = root {
            let val = node.borrow().val;
            node_queue.push_back((node.clone(), String::from(char::from_u32((val as u8 + b'a') as u32).unwrap())));
            
            while let Some((curr_node, current_string)) = node_queue.pop_front() {
                let node_ref = curr_node.borrow();
                
                if node_ref.left.is_none() && node_ref.right.is_none() {
                    if smallest_string.is_empty() || current_string < smallest_string {
                        smallest_string = current_string.clone();
                    }
                }
                
                if let Some(left_node) = &node_ref.left {
                    let left_val = left_node.borrow().val;
                    node_queue.push_back((
                        left_node.clone(),
                        format!("{}{}", char::from_u32((left_val as u8 + b'a') as u32).unwrap(), current_string)
                    ));
                }
                
                if let Some(right_node) = &node_ref.right {
                    let right_val = right_node.borrow().val;
                    node_queue.push_back((
                        right_node.clone(),
                        format!("{}{}", char::from_u32((right_val as u8 + b'a') as u32).unwrap(), current_string)
                    ));
                }
            }
        }
        
        smallest_string
    }
}
