impl Solution {
    pub fn longest_common_subpath(n: i32, paths: Vec<Vec<i32>>) -> i32 {
        let mut combined = Vec::new();
        let mut path_origin = Vec::new();
        for (i, p) in paths.iter().enumerate() {
            for &v in p {
                combined.push(v);
                path_origin.push(i as i32);
            }
            combined.push(-(i as i32 + 1));
            path_origin.push(i as i32);
        }
        let n_total = combined.len();
        let m = paths.len();

        let mut rank: Vec<i32> = combined.iter().map(|&x| {
            // coordinate compression
            let mut temp: Vec<i32> = combined.clone();
            temp.sort();
            temp.dedup();
            temp.iter().position(|&y| y == x).unwrap() as i32
        }).collect();

        let mut k = 1;
        while k < n_total {
            let mut keys: Vec<u64> = Vec::new();
            for i in 0..n_total {
                let first = rank[i] as u64;
                let second = if i + k < n_total { rank[i + k] as u64 + 1 } else { 0 };
                keys.push((first << 32) | second);
            }
            let mut sorted = keys.clone();
            sorted.sort();
            sorted.dedup();
            for i in 0..n_total {
                rank[i] = sorted.iter().position(|&x| x == keys[i]).unwrap() as i32;
            }
            if k >= n_total { break; }
            k *= 2;
        }

        let mut sa = vec![0usize; n_total];
        for (i, &r) in rank.iter().enumerate() {
            sa[r as usize] = i;
        }

        let mut lcp = vec![0i32; n_total];
        let inv_sa = rank.clone();
        let mut h = 0usize;
        for i in 0..n_total {
            if inv_sa[i] > 0 {
                let j = sa[inv_sa[i] as usize - 1];
                while i + h < n_total && j + h < n_total && combined[i + h] == combined[j + h] {
                    h += 1;
                }
                lcp[inv_sa[i] as usize] = h as i32;
                if h > 0 { h -= 1; }
            }
        }

        let mut ans = 0;
        let mut left = 0;
        let mut count = vec![0i32; m];
        let mut distinct = 0;
        let mut min_q: VecDeque<usize> = VecDeque::new();

        for right in 0..n_total {
            let p = path_origin[sa[right]];
            if p >= 0 {
                if count[p as usize] == 0 { distinct += 1; }
                count[p as usize] += 1;
            }
            while let Some(&back) = min_q.back() {
                if lcp[back] >= lcp[right] {
                    min_q.pop_back();
                } else {
                    break;
                }
            }
            min_q.push_back(right);

            while distinct == m {
                while let Some(&front) = min_q.front() {
                    if front <= left {
                        min_q.pop_front();
                    } else {
                        break;
                    }
                }
                if let Some(&front) = min_q.front() {
                    ans = ans.max(lcp[front]);
                }
                let out = path_origin[sa[left]];
                if out >= 0 {
                    count[out as usize] -= 1;
                    if count[out as usize] == 0 { distinct -= 1; }
                }
                left += 1;
            }
        }
        ans
    }
}
