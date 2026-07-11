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
    pub fn max_ancestor_diff(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut m = vec![0];
        Self::dfs(&root, &mut m);
        m[0]
    }
    
    fn dfs(root: &Option<Rc<RefCell<TreeNode>>>, m: &mut Vec<i32>) -> (i32, i32) {
        match root {
            None => (i32::MAX, i32::MIN),
            Some(node) => {
                let node = node.borrow();
                let (left_min, left_max) = Self::dfs(&node.left, m);
                let (right_min, right_max) = Self::dfs(&node.right, m);
                let min_val = node.val.min(left_min).min(right_min);
                let max_val = node.val.max(left_max).max(right_max);
                m[0] = m[0].max((min_val - node.val).abs().max((max_val - node.val).abs()));
                (min_val, max_val)
            }
        }
    }
}
