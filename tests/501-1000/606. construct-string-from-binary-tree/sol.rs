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
    pub fn tree2str(root: Option<Rc<RefCell<TreeNode>>>) -> String {
        if root.is_none() {
            return String::new();
        }
        let node = root.as_ref().unwrap().borrow();
        let mut s = node.val.to_string();
        if node.left.is_some() || node.right.is_some() {
            s.push('(');
            s.push_str(&Self::tree2str(node.left.clone()));
            s.push(')');
        }
        if node.right.is_some() {
            s.push('(');
            s.push_str(&Self::tree2str(node.right.clone()));
            s.push(')');
        }
        s
    }
}
