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
    pub fn longest_zig_zag(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        if root.is_none() {
            return 0;
        }
        let mut best = 0;
        let mut stack = vec![(root.unwrap(), 0, 0)];
        while let Some((node_rc, ended_left, ended_right)) = stack.pop() {
            let node = node_rc.borrow();
            best = best.max(ended_left).max(ended_right);
            if let Some(left) = node.left.clone() {
                stack.push((left, ended_right + 1, 0));
            }
            if let Some(right) = node.right.clone() {
                stack.push((right, 0, ended_left + 1));
            }
        }
        best
    }
}
