impl Solution {
    pub fn can_be_equal(target: Vec<i32>, arr: Vec<i32>) -> bool {
        let mut counts = vec![0i32; 1001];
        
        for i in 0..target.len() {
            counts[target[i] as usize] += 1;
            counts[arr[i] as usize] -= 1;
        }
        
        counts.iter().all(|&c| c == 0)
    }
}
