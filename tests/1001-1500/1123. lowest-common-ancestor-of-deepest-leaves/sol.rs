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
    pub fn lca_deepest_leaves(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        fn dfs(node: &Option<Rc<RefCell<TreeNode>>>, depth: i32) -> (Option<Rc<RefCell<TreeNode>>>, i32) {
            match node {
                None => (None, depth),
                Some(n) => {
                    let n = n.borrow();
                    let left = dfs(&n.left, depth + 1);
                    let right = dfs(&n.right, depth + 1);
                    
                    if left.1 > right.1 {
                        (left.0, left.1)
                    } else if right.1 > left.1 {
                        (right.0, right.1)
                    } else {
                        (node.clone(), left.1)
                    }
                }
            }
        }
        
        dfs(&root, 0).0
    }
}
