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
    pub fn distribute_coins(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut moves = 0;
        
        fn solve(node: Option<Rc<RefCell<TreeNode>>>, moves: &mut i32) -> i32 {
            match node {
                None => 0,
                Some(n) => {
                    let n = n.borrow();
                    let left_candie = solve(n.left.clone(), moves);
                    let right_candie = solve(n.right.clone(), moves);
                    *moves += left_candie.abs() + right_candie.abs();
                    (left_candie + right_candie + n.val) - 1
                }
            }
        }
        
        solve(root, &mut moves);
        moves
    }
}
