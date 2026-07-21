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
    pub fn deepest_leaves_sum(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut depth_map: HashMap<i32, i32> = HashMap::new();
        
        fn dfs(node: Option<&Rc<RefCell<TreeNode>>>, depth: i32, depth_map: &mut HashMap<i32, i32>) {
            if let Some(n) = node {
                let n = n.borrow();
                if n.left.is_none() && n.right.is_none() {
                    *depth_map.entry(depth).or_insert(0) += n.val;
                }
                dfs(n.left.as_ref(), depth + 1, depth_map);
                dfs(n.right.as_ref(), depth + 1, depth_map);
            }
        }
        
        dfs(root.as_ref(), 0, &mut depth_map);
        
        let max_depth = depth_map.keys().max().copied().unwrap_or(0);
        *depth_map.get(&max_depth).unwrap_or(&0)
    }
}
