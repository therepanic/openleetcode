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
    pub fn find_tilt(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn helper(n: Option<&Rc<RefCell<TreeNode>>>, ans: &mut i32) -> i32 {
            match n {
                None => 0,
                Some(node) => {
                    let node = node.borrow();
                    let l = helper(node.left.as_ref(), ans);
                    let r = helper(node.right.as_ref(), ans);
                    *ans += (l - r).abs();
                    l + r + node.val
                }
            }
        }
        let mut ans = 0;
        helper(root.as_ref(), &mut ans);
        ans
    }
}
