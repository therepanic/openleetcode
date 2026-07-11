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
    pub fn sum_root_to_leaf(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn dfs(node: &Option<Rc<RefCell<TreeNode>>>, current: i32) -> i32 {
            match node {
                None => return 0,
                Some(n) => {
                    let n = n.borrow();
                    let current = current * 2 + n.val;
                    
                    if n.left.is_none() && n.right.is_none() {
                        return current;
                    }
                    
                    return dfs(&n.left, current) + dfs(&n.right, current);
                }
            }
        }
        
        dfs(&root, 0)
    }
}
