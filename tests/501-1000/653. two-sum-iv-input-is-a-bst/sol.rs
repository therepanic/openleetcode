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
    pub fn find_target(root: Option<Rc<RefCell<TreeNode>>>, k: i32) -> bool {
        use std::collections::HashSet;
        let mut seen = HashSet::new();
        
        fn dfs(node: &Option<Rc<RefCell<TreeNode>>>, k: i32, seen: &mut HashSet<i32>) -> bool {
            match node {
                None => false,
                Some(n) => {
                    let n = n.borrow();
                    if seen.contains(&(k - n.val)) {
                        return true;
                    }
                    seen.insert(n.val);
                    dfs(&n.left, k, seen) || dfs(&n.right, k, seen)
                }
            }
        }
        
        dfs(&root, k, &mut seen)
    }
}
