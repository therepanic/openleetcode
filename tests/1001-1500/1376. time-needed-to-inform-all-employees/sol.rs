impl Solution {
    pub fn num_of_minutes(n: i32, head_id: i32, manager: Vec<i32>, inform_time: Vec<i32>) -> i32 {
        let n = n as usize;
        let head_id = head_id as usize;
        let mut children: Vec<Vec<usize>> = vec![vec![]; n];
        for (employee, &parent) in manager.iter().enumerate() {
            if parent != -1 {
                children[parent as usize].push(employee);
            }
        }
        let mut stack: Vec<(usize, i32)> = vec![(head_id, 0)];
        let mut answer = 0;
        while let Some((employee, elapsed)) = stack.pop() {
            answer = answer.max(elapsed);
            for &child in &children[employee] {
                stack.push((child, elapsed + inform_time[employee]));
            }
        }
        answer
    }
}
