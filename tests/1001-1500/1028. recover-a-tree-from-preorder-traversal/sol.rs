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
    pub fn recover_from_preorder(traversal: String) -> Option<Rc<RefCell<TreeNode>>> {
        let chars = traversal.as_bytes();
        let mut i = 0usize;
        let mut stack: Vec<Rc<RefCell<TreeNode>>> = Vec::new();
        while i < chars.len() {
            let mut depth = 0usize;
            while i < chars.len() && chars[i] == b'-' {
                depth += 1;
                i += 1;
            }
            let mut num = 0i32;
            while i < chars.len() && chars[i].is_ascii_digit() {
                num = num * 10 + (chars[i] - b'0') as i32;
                i += 1;
            }
            let node = Rc::new(RefCell::new(TreeNode::new(num)));
            while stack.len() > depth {
                stack.pop();
            }
            if let Some(parent) = stack.last() {
                let mut p = parent.borrow_mut();
                if p.left.is_none() {
                    p.left = Some(node.clone());
                } else {
                    p.right = Some(node.clone());
                }
            }
            stack.push(node);
        }
        stack.first().cloned()
    }
}
