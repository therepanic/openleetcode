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
    pub fn is_subtree(root: Option<Rc<RefCell<TreeNode>>>, sub_root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        fn ser(n: &Option<Rc<RefCell<TreeNode>>>) -> String {
            match n {
                None => ",#".to_string(),
                Some(node) => {
                    let node = node.borrow();
                    format!(",{}{}{}", node.val, ser(&node.left), ser(&node.right))
                }
            }
        }
        let r = ser(&root);
        let s = ser(&sub_root);
        r.contains(&s)
    }
}
