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
    pub fn leaf_similar(root1: Option<Rc<RefCell<TreeNode>>>, root2: Option<Rc<RefCell<TreeNode>>>) -> bool {
        fn helper(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
            let mut leaves = Vec::new();
            let mut stack = match root {
                Some(node) => vec![node],
                None => return leaves,
            };
            while let Some(node) = stack.pop() {
                let node = node.borrow();
                if node.left.is_none() && node.right.is_none() {
                    leaves.push(node.val);
                }
                if let Some(right) = &node.right {
                    stack.push(right.clone());
                }
                if let Some(left) = &node.left {
                    stack.push(left.clone());
                }
            }
            leaves
        }
        helper(root1) == helper(root2)
    }
}
