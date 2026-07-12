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
    pub fn is_cousins(root: Option<Rc<RefCell<TreeNode>>>, x: i32, y: i32) -> bool {
        let mut res: Vec<(Option<i32>, i32)> = Vec::new();
        let mut stack: Vec<(Rc<RefCell<TreeNode>>, Option<Rc<RefCell<TreeNode>>>, i32)> = Vec::new();
        stack.push((root.unwrap(), None, 0));
        while let Some((curr_rc, parent, depth)) = stack.pop() {
            let curr = curr_rc.borrow();
            if curr.val == x || curr.val == y {
                let parent_val = parent.map(|p| p.borrow().val);
                res.push((parent_val, depth));
            }
            if let Some(left) = &curr.left {
                stack.push((Rc::clone(left), Some(Rc::clone(&curr_rc)), depth + 1));
            }
            if let Some(right) = &curr.right {
                stack.push((Rc::clone(right), Some(Rc::clone(&curr_rc)), depth + 1));
            }
        }
        res.len() == 2 && res[0].1 == res[1].1 && res[0].0 != res[1].0
    }
}
