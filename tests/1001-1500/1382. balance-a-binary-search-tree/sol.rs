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
    pub fn balance_bst(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut vals = Vec::new();
        Self::inorder(&root, &mut vals);
        Self::build(&vals, 0, vals.len() as i32 - 1)
    }
    
    fn inorder(node: &Option<Rc<RefCell<TreeNode>>>, vals: &mut Vec<i32>) {
        if let Some(n) = node {
            Self::inorder(&n.borrow().left, vals);
            vals.push(n.borrow().val);
            Self::inorder(&n.borrow().right, vals);
        }
    }
    
    fn build(vals: &Vec<i32>, l: i32, r: i32) -> Option<Rc<RefCell<TreeNode>>> {
        if l > r {
            return None;
        }
        let mid = (l + r) / 2;
        let mut node = TreeNode::new(vals[mid as usize]);
        node.left = Self::build(vals, l, mid - 1);
        node.right = Self::build(vals, mid + 1, r);
        Some(Rc::new(RefCell::new(node)))
    }
}
