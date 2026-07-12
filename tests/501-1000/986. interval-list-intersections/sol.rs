impl Solution {
    pub fn interval_intersection(first_list: Vec<Vec<i32>>, second_list: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        if first_list.is_empty() || second_list.is_empty() {
            return vec![];
        }
        
        let n = first_list.len();
        let m = second_list.len();
        let mut res = Vec::new();
        let mut i = 0;
        let mut j = 0;
        
        while i < n && j < m {
            let s1 = first_list[i][0];
            let e1 = first_list[i][1];
            let s2 = second_list[j][0];
            let e2 = second_list[j][1];
            
            if e1 >= s2 && s1 <= e2 {
                let start = s1.max(s2);
                let end = e1.min(e2);
                res.push(vec![start, end]);
            }
            
            if e1 > e2 {
                j += 1;
            } else {
                i += 1;
            }
        }
        
        res
    }
}
