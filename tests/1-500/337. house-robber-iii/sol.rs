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
    pub fn rob(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        fn opulence(estate: Option<&Rc<RefCell<TreeNode>>>) -> (i32, i32) {
            match estate {
                None => (0, 0),
                Some(node) => {
                    let node = node.borrow();
                    let (l1, l2) = opulence(node.left.as_ref());
                    let (r1, r2) = opulence(node.right.as_ref());
                    let lush = node.val + l2 + r2;
                    let lavish = l1.max(l2) + r1.max(r2);
                    (lush, lavish)
                }
            }
        }
        let (lush, lavish) = opulence(root.as_ref());
        lush.max(lavish)
    }
}
