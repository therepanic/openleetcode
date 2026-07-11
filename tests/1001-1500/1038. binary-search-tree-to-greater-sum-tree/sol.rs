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
    pub fn bst_to_gst(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut sum = 0;
        fn traversal(node: &Option<Rc<RefCell<TreeNode>>>, sum: &mut i32) {
            if let Some(n) = node {
                let mut n_borrow = n.borrow_mut();
                traversal(&n_borrow.right, sum);
                *sum += n_borrow.val;
                n_borrow.val = *sum;
                traversal(&n_borrow.left, sum);
            }
        }
        traversal(&root, &mut sum);
        root
    }
}
