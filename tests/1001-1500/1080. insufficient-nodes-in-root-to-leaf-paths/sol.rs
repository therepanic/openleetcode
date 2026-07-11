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
    pub fn sufficient_subset(root: Option<Rc<RefCell<TreeNode>>>, limit: i32) -> Option<Rc<RefCell<TreeNode>>> {
        fn dfs(node: &Option<Rc<RefCell<TreeNode>>>, path_sum: i32, limit: i32) -> bool {
            if let Some(n) = node {
                let mut n = n.borrow_mut();
                let curr = path_sum + n.val;
                
                if n.left.is_none() && n.right.is_none() {
                    return curr >= limit;
                }
                
                let left_good = dfs(&n.left, curr, limit);
                let right_good = dfs(&n.right, curr, limit);
                
                if !left_good {
                    n.left = None;
                }
                if !right_good {
                    n.right = None;
                }
                
                left_good || right_good
            } else {
                false
            }
        }
        
        if dfs(&root, 0, limit) {
            root
        } else {
            None
        }
    }
}
