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
    pub fn sum_of_left_leaves(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn dfs(node: Option<&Rc<RefCell<TreeNode>>>, is_left: bool) -> i32 {
            match node {
                None => 0,
                Some(n) => {
                    let n = n.borrow();
                    if n.left.is_none() && n.right.is_none() {
                        if is_left { n.val } else { 0 }
                    } else {
                        dfs(n.left.as_ref(), true) + dfs(n.right.as_ref(), false)
                    }
                }
            }
        }
        dfs(root.as_ref(), false)
    }
}
