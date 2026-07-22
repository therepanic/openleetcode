impl Solution {
    pub fn minimum_abs_difference(arr: Vec<i32>) -> Vec<Vec<i32>> {
        let mut arr = arr;
        arr.sort();
        let min_diff = arr.windows(2).map(|w| w[1] - w[0]).min().unwrap();
        arr.windows(2)
            .filter(|w| w[1] - w[0] == min_diff)
            .map(|w| vec![w[0], w[1]])
            .collect()
    }
}
