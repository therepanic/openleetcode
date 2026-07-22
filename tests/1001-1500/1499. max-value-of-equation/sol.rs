impl Solution {
    pub fn find_max_value_of_equation(points: Vec<Vec<i32>>, k: i32) -> i32 {
        use std::collections::VecDeque;
        let mut window: VecDeque<(i32, i32)> = VecDeque::new();
        let mut answer = i32::MIN;
        for point in &points {
            let x = point[0];
            let y = point[1];
            while let Some(&(_, front_x)) = window.front() {
                if x - front_x <= k {
                    break;
                }
                window.pop_front();
            }
            if let Some(&(front_val, _)) = window.front() {
                answer = answer.max(x + y + front_val);
            }
            let value = y - x;
            while let Some(&(back_val, _)) = window.back() {
                if back_val > value {
                    break;
                }
                window.pop_back();
            }
            window.push_back((value, x));
        }
        answer
    }
}
