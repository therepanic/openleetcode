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
    pub fn binary_tree_paths(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<String> {
        let mut res = Vec::new();
        if root.is_none() {
            return res;
        }
        let mut stack = vec![(root.unwrap(), String::new())];
        while let Some((rc_node, path)) = stack.pop() {
            let node = rc_node.borrow();
            let new_path = if path.is_empty() {
                node.val.to_string()
            } else {
                path + "->" + &node.val.to_string()
            };
            if node.left.is_none() && node.right.is_none() {
                res.push(new_path.clone());
            }
            if let Some(ref right) = node.right {
                stack.push((right.clone(), new_path.clone()));
            }
            if let Some(ref left) = node.left {
                stack.push((left.clone(), new_path));
            }
        }
        res
    }
}
