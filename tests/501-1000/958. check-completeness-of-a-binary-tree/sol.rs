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
    pub fn is_complete_tree(root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        use std::collections::VecDeque;
        let mut q: VecDeque<Option<Rc<RefCell<TreeNode>>>> = VecDeque::new();
        q.push_back(root);
        let mut past = false;
        while let Some(node) = q.pop_front() {
            match node {
                None => {
                    past = true;
                }
                Some(n) => {
                    if past {
                        return false;
                    }
                    let n = n.borrow();
                    q.push_back(n.left.clone());
                    q.push_back(n.right.clone());
                }
            }
        }
        true
    }
}
