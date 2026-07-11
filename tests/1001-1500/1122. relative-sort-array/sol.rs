impl Solution {
    pub fn relative_sort_array(arr1: Vec<i32>, arr2: Vec<i32>) -> Vec<i32> {
        let mut freq = vec![0; 1001];
        let mut arr1 = arr1;
        for &num in &arr1 {
            freq[num as usize] += 1;
        }
        let mut idx = 0;
        for &num in &arr2 {
            while freq[num as usize] > 0 {
                arr1[idx] = num;
                idx += 1;
                freq[num as usize] -= 1;
            }
        }
        for num in 0..1001 {
            while freq[num] > 0 {
                arr1[idx] = num as i32;
                idx += 1;
                freq[num] -= 1;
            }
        }
        arr1
    }
}
