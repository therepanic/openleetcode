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
    pub fn increasing_bst(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut vals = Vec::new();
        Self::inord(&root, &mut vals);
        Self::create(&vals, 0)
    }
    
    fn create(vals: &Vec<i32>, i: usize) -> Option<Rc<RefCell<TreeNode>>> {
        if i >= vals.len() {
            return None;
        }
        let node = Rc::new(RefCell::new(TreeNode::new(vals[i])));
        node.borrow_mut().right = Self::create(vals, i + 1);
        Some(node)
    }
    
    fn inord(root: &Option<Rc<RefCell<TreeNode>>>, vals: &mut Vec<i32>) {
        if let Some(node) = root {
            let node = node.borrow();
            Self::inord(&node.left, vals);
            vals.push(node.val);
            Self::inord(&node.right, vals);
        }
    }
}
