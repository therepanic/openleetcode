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
    pub fn min_camera_cover(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn dfs(node: &Option<Rc<RefCell<TreeNode>>>) -> i32 {
            match node {
                None => 0,
                Some(n) => {
                    let mut node_ref = n.borrow_mut();
                    let res = dfs(&node_ref.left) + dfs(&node_ref.right);
                    let mut curr = i32::MAX;
                    if let Some(left) = &node_ref.left {
                        curr = curr.min(left.borrow().val);
                    }
                    if let Some(right) = &node_ref.right {
                        curr = curr.min(right.borrow().val);
                    }
                    if curr == 0 {
                        node_ref.val = 1;
                        return res + 1;
                    } else if curr == 1 {
                        node_ref.val = 2;
                    }
                    res
                }
            }
        }
        let ans = dfs(&root);
        let root_val = root.as_ref().unwrap().borrow().val;
        ans + if root_val == 0 { 1 } else { 0 }
    }
}
