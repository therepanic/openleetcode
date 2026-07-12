impl Solution {
    pub fn largest_time_from_digits(arr: Vec<i32>) -> String {
        let mut arr = arr;
        let mut perm_list = Vec::new();
        Self::permute(&mut arr, 0, &mut perm_list);
        
        let mut best_time: i32 = -1;
        let mut best_idx: i32 = -1;
        
        for i in 0..perm_list.len() {
            let perm = &perm_list[i];
            let hours = perm[0] * 10 + perm[1];
            let minutes = perm[2] * 10 + perm[3];
            
            if hours < 24 && minutes < 60 {
                let curr_time = hours * 60 + minutes;
                if curr_time > best_time {
                    best_time = curr_time;
                    best_idx = i as i32;
                }
            }
        }
        
        if best_idx == -1 {
            return String::new();
        }
        
        let res = &perm_list[best_idx as usize];
        format!("{}{}:{}{}", res[0], res[1], res[2], res[3])
    }
    
    fn permute(arr: &mut Vec<i32>, start: usize, result: &mut Vec<Vec<i32>>) {
        if start == arr.len() {
            result.push(arr.clone());
            return;
        }
        for i in start..arr.len() {
            arr.swap(start, i);
            Self::permute(arr, start + 1, result);
            arr.swap(start, i);
        }
    }
}
