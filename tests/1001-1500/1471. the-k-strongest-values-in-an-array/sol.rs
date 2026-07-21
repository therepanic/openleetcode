impl Solution {
    pub fn get_strongest(arr: Vec<i32>, k: i32) -> Vec<i32> {
        let mut arr = arr;
        arr.sort_unstable();
        let m = arr[((arr.len() - 1) / 2) as usize];
        
        let mut left = 0;
        let mut right = arr.len() - 1;
        let mut result = Vec::with_capacity(k as usize);
        for _ in 0..k {
            if (arr[right] - m).abs() >= (arr[left] - m).abs() {
                result.push(arr[right]);
                if right > 0 { right -= 1; }
            } else {
                result.push(arr[left]);
                left += 1;
            }
        }
        result
    }
}
