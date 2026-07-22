impl Solution {
    pub fn num_submat(mat: Vec<Vec<i32>>) -> i32 {
        let r = mat.len();
        let c = mat[0].len();
        let mut h = vec![0; c];
        let mut ans = 0;
        
        for i in 0..r {
            for j in 0..c {
                h[j] = if mat[i][j] == 1 { h[j] + 1 } else { 0 };
            }
            
            let mut sumv = vec![0; c];
            let mut st: Vec<usize> = Vec::new();
            
            for j in 0..c {
                while !st.is_empty() && h[st[st.len() - 1]] >= h[j] {
                    st.pop();
                }
                
                if let Some(&p) = st.last() {
                    sumv[j] = sumv[p] + h[j] * (j - p) as i32;
                } else {
                    sumv[j] = h[j] * (j + 1) as i32;
                }
                
                st.push(j);
                ans += sumv[j];
            }
        }
        
        ans
    }
}
