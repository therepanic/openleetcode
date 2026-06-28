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
    pub fn convert_bst(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut total = 0;
        
        fn traverse(node: Option<Rc<RefCell<TreeNode>>>, total: &mut i32) {
            if let Some(n) = node {
                let mut borrow = n.borrow_mut();
                traverse(borrow.right.clone(), total);
                *total += borrow.val;
                borrow.val = *total;
                traverse(borrow.left.clone(), total);
            }
        }
        
        traverse(root.clone(), &mut total);
        root
    }
}
