impl Solution {
    pub fn can_three_parts_equal_sum(arr: Vec<i32>) -> bool {
        let total: i32 = arr.iter().sum();
        if total % 3 != 0 {
            return false;
        }
        let target = total / 3;
        let mut current_sum = 0;
        let mut partitions = 0;
        for i in 0..arr.len() {
            current_sum += arr[i];
            if current_sum == target {
                partitions += 1;
                current_sum = 0;
                if partitions == 2 && i < arr.len() - 1 {
                    return true;
                }
            }
        }
        false
    }
}
