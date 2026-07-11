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
    pub fn flip_equiv(root1: Option<Rc<RefCell<TreeNode>>>, root2: Option<Rc<RefCell<TreeNode>>>) -> bool {
        match (root1, root2) {
            (None, None) => true,
            (Some(n1), Some(n2)) => {
                let n1 = n1.borrow();
                let n2 = n2.borrow();
                if n1.val != n2.val {
                    return false;
                }
                let no_flip = Self::flip_equiv(n1.left.clone(), n2.left.clone()) && Self::flip_equiv(n1.right.clone(), n2.right.clone());
                let yes_flip = Self::flip_equiv(n1.left.clone(), n2.right.clone()) && Self::flip_equiv(n1.right.clone(), n2.left.clone());
                no_flip || yes_flip
            },
            _ => false,
        }
    }
}
