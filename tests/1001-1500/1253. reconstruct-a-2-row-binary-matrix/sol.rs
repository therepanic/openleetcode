impl Solution {
    pub fn reconstruct_matrix(upper: i32, lower: i32, colsum: Vec<i32>) -> Vec<Vec<i32>> {
        let sum: i32 = colsum.iter().sum();
        if upper + lower != sum {
            return vec![];
        }
        
        let n = colsum.len();
        let mut row1 = vec![0; n];
        let mut row2 = vec![0; n];
        let mut u = upper;
        let mut l = lower;
        
        for i in 0..n {
            if colsum[i] == 2 {
                row1[i] = 1;
                row2[i] = 1;
                u -= 1;
                l -= 1;
            } else if colsum[i] == 1 {
                if u > l {
                    row1[i] = 1;
                    u -= 1;
                } else {
                    row2[i] = 1;
                    l -= 1;
                }
            }
        }
        
        if l == 0 && u == 0 {
            vec![row1, row2]
        } else {
            vec![]
        }
    }
}
