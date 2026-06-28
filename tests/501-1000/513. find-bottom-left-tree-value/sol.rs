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
impl Solution {
    pub fn find_bottom_left_value(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut queue = std::collections::VecDeque::new();
        let root_node = root.unwrap();
        let leftmost = root_node.borrow().val;
        queue.push_back(root_node);

        let mut leftmost = leftmost;

        while !queue.is_empty() {
            let level_size = queue.len();
            leftmost = queue.front().unwrap().borrow().val;

            for _ in 0..level_size {
                let node = queue.pop_front().unwrap();
                let node_ref = node.borrow();
                if let Some(left) = &node_ref.left {
                    queue.push_back(left.clone());
                }
                if let Some(right) = &node_ref.right {
                    queue.push_back(right.clone());
                }
            }
        }

        leftmost
    }
}
