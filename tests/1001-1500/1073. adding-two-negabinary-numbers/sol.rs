impl Solution {
    pub fn add_negabinary(arr1: Vec<i32>, arr2: Vec<i32>) -> Vec<i32> {
        let mut res = Vec::new();
        let mut i = arr1.len() as i32 - 1;
        let mut j = arr2.len() as i32 - 1;
        let mut carry = 0i32;
        
        while carry != 0 || i >= 0 || j >= 0 {
            if i >= 0 {
                carry += arr1[i as usize];
                i -= 1;
            }
            if j >= 0 {
                carry += arr2[j as usize];
                j -= 1;
            }
            res.push(carry & 1);
            carry = -(carry >> 1);
        }
        
        while res.len() > 1 && res[res.len() - 1] == 0 {
            res.pop();
        }
        
        res.reverse();
        res
    }
}
