impl Solution {
    pub fn get_min_swaps(num: String, k: i32) -> i32 {
        let mut arr: Vec<char> = num.chars().collect();
        let mut target: Vec<char> = num.chars().collect();
        
        for _ in 0..k {
            Self::next_permutation(&mut target);
        }
        
        let mut swaps = 0;
        arr = num.chars().collect();
        
        for i in 0..arr.len() {
            if arr[i] == target[i] { continue; }
            
            let mut j = i;
            while arr[j] != target[i] { j += 1; }
            
            while j > i {
                arr.swap(j, j - 1);
                j -= 1;
                swaps += 1;
            }
        }
        
        swaps
    }
    
    fn next_permutation(arr: &mut Vec<char>) {
        let mut i = arr.len() as i32 - 2;
        while i >= 0 && arr[i as usize] >= arr[(i + 1) as usize] {
            i -= 1;
        }
        if i == -1 { return; }
        
        let mut j = arr.len() as i32 - 1;
        while arr[j as usize] <= arr[i as usize] {
            j -= 1;
        }
        
        arr.swap(i as usize, j as usize);
        
        let mut left = i as usize + 1;
        let mut right = arr.len() - 1;
        while left < right {
            arr.swap(left, right);
            left += 1;
            right -= 1;
        }
    }
}
