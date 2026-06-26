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
    pub fn largest_values(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, level: usize, res: &mut Vec<i32>) {
            if let Some(n) = node {
                let n = n.borrow();
                if level == res.len() {
                    res.push(n.val);
                } else {
                    res[level] = res[level].max(n.val);
                }
                dfs(n.left.clone(), level + 1, res);
                dfs(n.right.clone(), level + 1, res);
            }
        }
        let mut res = Vec::new();
        dfs(root, 0, &mut res);
        res
    }
}
