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
    pub fn longest_univalue_path(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn solve(node: &Option<Rc<RefCell<TreeNode>>>, ans: &mut i32) -> i32 {
            match node {
                None => 0,
                Some(n) => {
                    let n = n.borrow();
                    let left = solve(&n.left, ans);
                    let right = solve(&n.right, ans);
                    let mut left_path = 0;
                    let mut right_path = 0;
                    if let Some(ref left_node) = n.left {
                        if left_node.borrow().val == n.val {
                            left_path = left + 1;
                        }
                    }
                    if let Some(ref right_node) = n.right {
                        if right_node.borrow().val == n.val {
                            right_path = right + 1;
                        }
                    }
                    *ans = (*ans).max(left_path + right_path);
                    left_path.max(right_path)
                }
            }
        }
        let mut ans = 0;
        solve(&root, &mut ans);
        ans
    }
}
