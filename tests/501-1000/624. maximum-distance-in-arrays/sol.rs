impl Solution {
    pub fn max_distance(arrays: Vec<Vec<i32>>) -> i32 {
        let mut smallest = arrays[0][0];
        let mut largest = arrays[0][arrays[0].len() - 1];
        let mut ans = 0;
        for i in 1..arrays.len() {
            let cur_min = arrays[i][0];
            let cur_max = arrays[i][arrays[i].len() - 1];
            ans = ans.max((largest - cur_min).max(cur_max - smallest));
            smallest = smallest.min(cur_min);
            largest = largest.max(cur_max);
        }
        ans
    }
}
