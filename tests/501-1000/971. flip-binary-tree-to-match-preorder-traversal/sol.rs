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
    pub fn flip_match_voyage(root: Option<Rc<RefCell<TreeNode>>>, voyage: Vec<i32>) -> Vec<i32> {
        let mut flipped_nodes = Vec::new();
        let mut idx = 0;
        
        fn dfs(
            node: &Option<Rc<RefCell<TreeNode>>>,
            voyage: &Vec<i32>,
            idx: &mut usize,
            flipped_nodes: &mut Vec<i32>
        ) -> bool {
            match node {
                None => true,
                Some(n) => {
                    let n = n.borrow();
                    if n.val != voyage[*idx] {
                        return false;
                    }
                    *idx += 1;
                    
                    if n.left.is_some() && n.right.is_some() {
                        let right_val = n.right.as_ref().unwrap().borrow().val;
                        let left_val = n.left.as_ref().unwrap().borrow().val;
                        if voyage[*idx] == right_val {
                            flipped_nodes.push(n.val);
                            if !dfs(&n.right, voyage, idx, flipped_nodes) {
                                return false;
                            }
                            if !dfs(&n.left, voyage, idx, flipped_nodes) {
                                return false;
                            }
                        } else if voyage[*idx] == left_val {
                            if !dfs(&n.left, voyage, idx, flipped_nodes) {
                                return false;
                            }
                            if !dfs(&n.right, voyage, idx, flipped_nodes) {
                                return false;
                            }
                        } else {
                            return false;
                        }
                    } else {
                        if n.left.is_some() {
                            if !dfs(&n.left, voyage, idx, flipped_nodes) {
                                return false;
                            }
                        } else if n.right.is_some() {
                            if !dfs(&n.right, voyage, idx, flipped_nodes) {
                                return false;
                            }
                        }
                    }
                    true
                }
            }
        }
        
        if !dfs(&root, &voyage, &mut idx, &mut flipped_nodes) {
            return vec![-1];
        }
        flipped_nodes
    }
}
