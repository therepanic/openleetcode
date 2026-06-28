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
    pub fn trim_bst(root: Option<Rc<RefCell<TreeNode>>>, low: i32, high: i32) -> Option<Rc<RefCell<TreeNode>>> {
        if let Some(node) = root {
            let val = node.borrow().val;
            
            if val < low {
                let right = node.borrow_mut().right.take();
                return Self::trim_bst(right, low, high);
            }
            if val > high {
                let left = node.borrow_mut().left.take();
                return Self::trim_bst(left, low, high);
            }
            
            let left = node.borrow_mut().left.take();
            let right = node.borrow_mut().right.take();
            
            node.borrow_mut().left = Self::trim_bst(left, low, high);
            node.borrow_mut().right = Self::trim_bst(right, low, high);
            
            Some(node)
        } else {
            None
        }
    }
}
