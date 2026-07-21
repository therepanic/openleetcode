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
    pub fn max_level_sum(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut idx = 0;
        let mut max_sum = i32::MIN;
        let mut q = std::collections::VecDeque::new();
        q.push_back(root.unwrap());
        let mut level = 1;
        while !q.is_empty() {
            let qz = q.len();
            let mut cur_sum = 0;
            for _ in 0..qz {
                let node = q.pop_front().unwrap();
                let node = node.borrow();
                cur_sum += node.val;
                if let Some(left) = &node.left {
                    q.push_back(left.clone());
                }
                if let Some(right) = &node.right {
                    q.push_back(right.clone());
                }
            }
            if cur_sum > max_sum {
                idx = level;
                max_sum = cur_sum;
            }
            level += 1;
        }
        idx
    }
}
