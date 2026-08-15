use std::collections::BinaryHeap;
use std::cmp::Reverse;

impl Solution {
    pub fn busiest_servers(k: i32, arrival: Vec<i32>, load: Vec<i32>) -> Vec<i32> {
        let k = k as usize;
        let mut available: BinaryHeap<Reverse<i32>> = (0..k as i32).map(Reverse).collect();
        let mut busy: BinaryHeap<(Reverse<i32>, i32)> = BinaryHeap::new();
        let mut res = vec![0; k];
        for i in 0..arrival.len() {
            let a = arrival[i];
            while let Some(&(Reverse(end), x)) = busy.peek() {
                if end <= a {
                    busy.pop();
                    let offset = ((x - i as i32) % k as i32 + k as i32) % k as i32;
                    available.push(Reverse(i as i32 + offset));
                } else {
                    break;
                }
            }
            if let Some(Reverse(j)) = available.pop() {
                let j = j as usize % k;
                busy.push((Reverse(a + load[i]), j as i32));
                res[j] += 1;
            }
        }
        let max = *res.iter().max().unwrap();
        (0..k).filter(|&i| res[i] == max).map(|i| i as i32).collect()
    }
}
