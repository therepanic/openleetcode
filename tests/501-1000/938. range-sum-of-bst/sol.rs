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
    pub fn range_sum_bst(root: Option<Rc<RefCell<TreeNode>>>, low: i32, high: i32) -> i32 {
        let mut res = 0;
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, low: i32, high: i32, res: &mut i32) {
            if let Some(n) = node {
                let n = n.borrow();
                dfs(n.left.clone(), low, high, res);
                if low <= n.val && n.val <= high {
                    *res += n.val;
                }
                dfs(n.right.clone(), low, high, res);
            }
        }
        dfs(root, low, high, &mut res);
        res
    }
}
