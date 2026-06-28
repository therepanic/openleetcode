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
    fn find_height(node: &Option<Rc<RefCell<TreeNode>>>) -> i32 {
        match node {
            None => 0,
            Some(n) => {
                let node = n.borrow();
                let mut height = 0;
                if node.left.is_some() {
                    height = height.max(1 + Self::find_height(&node.left));
                }
                if node.right.is_some() {
                    height = height.max(1 + Self::find_height(&node.right));
                }
                height
            }
        }
    }

    pub fn print_tree(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Vec<String>> {
        let height = Self::find_height(&root);
        let m = (height + 1) as usize;
        let n = (1 << (height + 1)) - 1;
        let mut matrix = vec![vec!["".to_string(); n as usize]; m];
        let mut queue = std::collections::VecDeque::new();
        queue.push_back((root.unwrap(), 0usize, (n - 1) as usize / 2));
        while let Some((node_rc, x, y)) = queue.pop_front() {
            let node = node_rc.borrow();
            matrix[x][y] = node.val.to_string();
            if let Some(left) = &node.left {
                queue.push_back((left.clone(), x + 1, y - (1 << (height as usize - x - 1))));
            }
            if let Some(right) = &node.right {
                queue.push_back((right.clone(), x + 1, y + (1 << (height as usize - x - 1))));
            }
        }
        matrix
    }
}
