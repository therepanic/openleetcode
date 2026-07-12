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
    pub fn construct_from_pre_post(preorder: Vec<i32>, postorder: Vec<i32>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut index = 0;
        Self::construct(&preorder, &postorder, &mut index, 0, preorder.len() as i32 - 1)
    }
    
    fn construct(pre: &[i32], post: &[i32], index: &mut usize, l: i32, h: i32) -> Option<Rc<RefCell<TreeNode>>> {
        if *index >= pre.len() || l > h {
            return None;
        }
        
        let root = Rc::new(RefCell::new(TreeNode::new(pre[*index])));
        *index += 1;
        if l == h {
            return Some(root);
        }
        
        let mut i = l;
        while i <= h && post[i as usize] != pre[*index] {
            i += 1;
        }
        
        if i <= h {
            root.borrow_mut().left = Self::construct(pre, post, index, l, i);
            root.borrow_mut().right = Self::construct(pre, post, index, i + 1, h - 1);
        }
        
        Some(root)
    }
}
