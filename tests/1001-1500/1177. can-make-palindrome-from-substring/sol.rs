impl Solution {
    pub fn can_make_pali_queries(s: String, queries: Vec<Vec<i32>>) -> Vec<bool> {
        let n = s.len();
        let mut prefix: Vec<u32> = vec![0; n + 1];
        let s_bytes = s.as_bytes();
        
        for i in 0..n {
            let bit: u32 = 1 << (s_bytes[i] - b'a');
            prefix[i + 1] = prefix[i] ^ bit;
        }
        
        let mut res = Vec::with_capacity(queries.len());
        
        for query in queries {
            let left = query[0] as usize;
            let right = query[1] as usize;
            let ki = query[2];
            
            let mask = prefix[right + 1] ^ prefix[left];
            let odd_count = mask.count_ones() as i32;
            
            if odd_count <= 1 || ki >= odd_count / 2 {
                res.push(true);
            } else {
                res.push(false);
            }
        }
        
        res
    }
}
