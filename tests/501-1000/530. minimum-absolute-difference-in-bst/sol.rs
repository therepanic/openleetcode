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
    pub fn get_minimum_difference(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, prev: &mut Option<i32>, ans: &mut i32) {
            if let Some(n) = node {
                let n = n.borrow();
                dfs(n.left.clone(), prev, ans);
                if let Some(p) = prev {
                    let diff = n.val - *p;
                    if diff < *ans {
                        *ans = diff;
                    }
                }
                *prev = Some(n.val);
                dfs(n.right.clone(), prev, ans);
            }
        }
        let mut prev = None;
        let mut ans = i32::MAX;
        dfs(root, &mut prev, &mut ans);
        ans
    }
}
