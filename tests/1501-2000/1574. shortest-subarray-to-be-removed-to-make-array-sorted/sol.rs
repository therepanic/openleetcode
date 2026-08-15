impl Solution {
    pub fn find_length_of_shortest_subarray(arr: Vec<i32>) -> i32 {
        let n = arr.len();
        let mut right = n - 1;
        while right > 0 && arr[right - 1] <= arr[right] {
            right -= 1;
        }
        if right == 0 {
            return 0;
        }
        let mut answer = right as i32;
        let mut left = 0;
        while left == 0 || (left < n && arr[left - 1] <= arr[left]) {
            while right < n && arr[left] > arr[right] {
                right += 1;
            }
            answer = answer.min((right - left - 1) as i32);
            left += 1;
            if left >= n {
                break;
            }
        }
        answer
    }
}
