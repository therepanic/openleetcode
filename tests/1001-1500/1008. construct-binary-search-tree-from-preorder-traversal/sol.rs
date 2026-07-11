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
    pub fn bst_from_preorder(preorder: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        if preorder.is_empty() {
            return None;
        }
        Self::build(&preorder, 0, preorder.len() - 1)
    }
    
    fn build(preorder: &Vec<i32>, start: usize, end: usize) -> Option<Rc<RefCell<TreeNode>>> {
        if start > end {
            return None;
        }
        let root = Rc::new(RefCell::new(TreeNode::new(preorder[start])));
        let mut i = start + 1;
        while i <= end && preorder[i] < preorder[start] {
            i += 1;
        }
        if start + 1 <= i.saturating_sub(1) {
            root.borrow_mut().left = Self::build(preorder, start + 1, i - 1);
        }
        if i <= end {
            root.borrow_mut().right = Self::build(preorder, i, end);
        }
        Some(root)
    }
}
