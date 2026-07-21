impl Solution {
    pub fn find_the_distance_value(arr1: Vec<i32>, arr2: Vec<i32>, d: i32) -> i32 {
        let mut arr2 = arr2;
        arr2.sort();
        let mut count = 0;
        for num in arr1 {
            let left_index = arr2.partition_point(|&x| x < num - d);
            let right_index = arr2.partition_point(|&x| x <= num + d);
            if left_index == right_index {
                count += 1;
            }
        }
        count
    }
}
