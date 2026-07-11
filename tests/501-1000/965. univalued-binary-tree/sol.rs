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
    pub fn is_unival_tree(root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        match root {
            None => true,
            Some(node) => {
                let node = node.borrow();
                if let Some(ref left) = node.left {
                    if left.borrow().val != node.val {
                        return false;
                    }
                }
                if let Some(ref right) = node.right {
                    if right.borrow().val != node.val {
                        return false;
                    }
                }
                Solution::is_unival_tree(node.left.clone()) && Solution::is_unival_tree(node.right.clone())
            }
        }
    }
}
