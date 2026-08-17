use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn assign_tasks(servers: Vec<i32>, tasks: Vec<i32>) -> Vec<i32> {
        let n = servers.len();
        let m = tasks.len();
        
        let mut available: BinaryHeap<Reverse<(i32, i32)>> = BinaryHeap::new();
        for i in 0..n {
            available.push(Reverse((servers[i], i as i32)));
        }
        
        let mut busy: BinaryHeap<(i32, i32, i32)> = BinaryHeap::new();
        let mut ans = Vec::with_capacity(m);
        let mut time = 0i32;
        
        for i in 0..m {
            time = time.max(i as i32);
            while let Some(&(free_time, weight, idx)) = busy.peek() {
                if -free_time <= time {
                    busy.pop();
                    available.push(Reverse((weight, idx)));
                } else {
                    break;
                }
            }
            
            if available.is_empty() {
                if let Some(&(free_time, _, _)) = busy.peek() {
                    time = -free_time;
                    while let Some(&(free_time, weight, idx)) = busy.peek() {
                        if -free_time <= time {
                            busy.pop();
                            available.push(Reverse((weight, idx)));
                        } else {
                            break;
                        }
                    }
                }
            }
            
            let Reverse((weight, idx)) = available.pop().unwrap();
            busy.push((- (time + tasks[i]), weight, idx));
            ans.push(idx);
        }
        
        ans
    }
}
