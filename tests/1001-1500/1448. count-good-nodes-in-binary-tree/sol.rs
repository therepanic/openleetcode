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
    pub fn good_nodes(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn dfs(node: Option<&Rc<RefCell<TreeNode>>>, max_so_far: i32) -> i32 {
            match node {
                None => 0,
                Some(n) => {
                    let n = n.borrow();
                    let count = if n.val >= max_so_far { 1 } else { 0 };
                    let new_max = max_so_far.max(n.val);
                    count + dfs(n.left.as_ref(), new_max) + dfs(n.right.as_ref(), new_max)
                }
            }
        }
        if let Some(root_node) = &root {
            let val = root_node.borrow().val;
            dfs(Some(root_node), val)
        } else {
            0
        }
    }
}
