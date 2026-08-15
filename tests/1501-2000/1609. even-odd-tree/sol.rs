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
    pub fn is_even_odd_tree(root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        fn collect(temp: Option<Rc<RefCell<TreeNode>>>, pos: usize, elements: &mut Vec<Vec<i32>>) -> bool {
            if let Some(node) = temp {
                if elements.len() == pos { elements.push(vec![]); }
                let node = node.borrow();
                let pos_check = pos % 2;
                let val_check = node.val % 2;
                if pos_check == 0 && val_check != 0 {
                    if let Some(&last) = elements[pos].last() {
                        if !(last < node.val) { return false; }
                    }
                    elements[pos].push(node.val);
                } else if pos_check != 0 && val_check == 0 {
                    if let Some(&last) = elements[pos].last() {
                        if !(last > node.val) { return false; }
                    }
                    elements[pos].push(node.val);
                } else {
                    return false;
                }
                let left = match &node.left {
                    Some(l) => Some(l.clone()),
                    None => None,
                };
                let right = match &node.right {
                    Some(r) => Some(r.clone()),
                    None => None,
                };
                return collect(left, pos + 1, elements) && collect(right, pos + 1, elements);
            }
            true
        }
        let mut elements = vec![vec![]];
        collect(root, 0, &mut elements)
    }
}
