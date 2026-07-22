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
    pub fn max_sum_bst(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn dfs(node: Option<Rc<RefCell<TreeNode>>>, best: &mut i32) -> (bool, i32, i32, i32) {
            match node {
                None => (true, i32::MAX, i32::MIN, 0),
                Some(n) => {
                    let n = n.borrow();
                    let (lbst, lmin, lmax, lsum) = dfs(n.left.clone(), best);
                    let (rbst, rmin, rmax, rsum) = dfs(n.right.clone(), best);
                    
                    if lbst && rbst && lmax < n.val && n.val < rmin {
                        let total = lsum + rsum + n.val;
                        *best = (*best).max(total);
                        let new_min = lmin.min(n.val);
                        let new_max = rmax.max(n.val);
                        return (true, new_min, new_max, total);
                    }
                    
                    (false, i32::MIN, i32::MAX, 0)
                }
            }
        }
        
        let mut best = 0;
        dfs(root, &mut best);
        best
    }
}
