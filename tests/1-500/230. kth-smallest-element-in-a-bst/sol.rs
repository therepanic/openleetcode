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
    pub fn kth_smallest(root: Option<Rc<RefCell<TreeNode>>>, k: i32) -> i32 {
        fn inorder_traversal(node: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
            match node {
                None => vec![],
                Some(n) => {
                    let n = n.borrow();
                    let mut left = inorder_traversal(n.left.clone());
                    let mut right = inorder_traversal(n.right.clone());
                    left.push(n.val);
                    left.append(&mut right);
                    left
                }
            }
        }
        
        let sorted_elements = inorder_traversal(root);
        sorted_elements[(k - 1) as usize]
    }
}
