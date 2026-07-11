impl Solution {
    pub fn moves_to_stamp(stamp: String, target: String) -> Vec<i32> {
        let m = stamp.len();
        let n = target.len();
        let stamp_bytes = stamp.as_bytes();
        let mut target_bytes = target.into_bytes();
        
        let can_stamp = |target_bytes: &[u8], i: usize| -> bool {
            for j in 0..m {
                if target_bytes[i + j] != b'?' && target_bytes[i + j] != stamp_bytes[j] {
                    return false;
                }
            }
            true
        };
        
        let apply_stamp = |target_bytes: &mut [u8], i: usize| {
            for j in 0..m {
                target_bytes[i + j] = b'?';
            }
        };
        
        let mut stamped = vec![false; n];
        let mut result = Vec::new();
        let mut queue = std::collections::VecDeque::new();
        
        for i in 0..=n - m {
            if can_stamp(&target_bytes, i) {
                apply_stamp(&mut target_bytes, i);
                queue.push_back(i);
                result.push(i as i32);
                stamped[i] = true;
            }
        }
        
        while let Some(pos) = queue.pop_front() {
            let start = if pos >= m - 1 { pos - m + 1 } else { 0 };
            let end = std::cmp::min(n - m, pos + m);
            for i in start..=end {
                if can_stamp(&target_bytes, i) {
                    if !stamped[i] {
                        apply_stamp(&mut target_bytes, i);
                        queue.push_back(i);
                        result.push(i as i32);
                        stamped[i] = true;
                    }
                }
            }
        }
        
        if target_bytes.iter().all(|&c| c == b'?') {
            result.reverse();
            result
        } else {
            Vec::new()
        }
    }
}
