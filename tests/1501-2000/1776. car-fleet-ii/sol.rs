impl Solution {
    pub fn get_collision_times(cars: Vec<Vec<i32>>) -> Vec<f64> {
        let n = cars.len();
        let mut right_greater = vec![-1i32; n];
        let mut ans = vec![-1.0f64; n];
        let mut stack: Vec<usize> = Vec::new();
        for r in (0..n).rev() {
            while !stack.is_empty() && cars[stack[stack.len() - 1]][1] >= cars[r][1] {
                stack.pop();
            }
            if !stack.is_empty() {
                right_greater[r] = stack[stack.len() - 1] as i32;
            }
            stack.push(r);
        }
        for r in (0..n).rev() {
            let mut collide_id = right_greater[r];
            while collide_id != -1 && ans[collide_id as usize] != -1.0 && ans[collide_id as usize] < (cars[collide_id as usize][0] - cars[r][0]) as f64 / (cars[r][1] - cars[collide_id as usize][1]) as f64 {
                collide_id = right_greater[collide_id as usize];
            }
            if collide_id != -1 {
                ans[r] = (cars[collide_id as usize][0] - cars[r][0]) as f64 / (cars[r][1] - cars[collide_id as usize][1]) as f64;
            }
        }
        ans
    }
}
