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
    pub fn vertical_traversal(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Vec<i32>> {
        let mut nodes: Vec<(i32, i32, i32)> = Vec::new();
        
        fn dfs(node: Option<&Rc<RefCell<TreeNode>>>, row: i32, col: i32, nodes: &mut Vec<(i32, i32, i32)>) {
            if let Some(n) = node {
                let n = n.borrow();
                nodes.push((col, row, n.val));
                dfs(n.left.as_ref(), row + 1, col - 1, nodes);
                dfs(n.right.as_ref(), row + 1, col + 1, nodes);
            }
        }
        
        dfs(root.as_ref(), 0, 0, &mut nodes);
        
        nodes.sort();
        
        let mut res: Vec<Vec<i32>> = Vec::new();
        let mut prev_col = i32::MIN;
        
        for (col, _, val) in nodes {
            if col != prev_col {
                res.push(Vec::new());
                prev_col = col;
            }
            res.last_mut().unwrap().push(val);
        }
        
        res
    }
}
