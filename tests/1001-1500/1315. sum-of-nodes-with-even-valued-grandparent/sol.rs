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
    pub fn sum_even_grandparent(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut queue = std::collections::VecDeque::new();
        queue.push_back((root, -1, -1));
        let mut res = 0;
        while let Some((node_opt, parent, grandparent)) = queue.pop_front() {
            if let Some(node_rc) = node_opt {
                let node = node_rc.borrow();
                if grandparent % 2 == 0 {
                    res += node.val;
                }
                if node.left.is_some() {
                    queue.push_back((node.left.clone(), node.val, parent));
                }
                if node.right.is_some() {
                    queue.push_back((node.right.clone(), node.val, parent));
                }
            }
        }
        res
    }
}
