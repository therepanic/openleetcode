impl Solution {
    pub fn min_domino_rotations(tops: Vec<i32>, bottoms: Vec<i32>) -> i32 {
        let n = tops.len();
        let mut res = i32::MAX;
        let mut face = vec![0; 7];
        for i in 0..n {
            face[tops[i] as usize] += 1;
            if bottoms[i] != tops[i] {
                face[bottoms[i] as usize] += 1;
            }
        }
        for x in 1..=6 {
            if face[x] < n {
                continue;
            }
            let mut maintain_top = 0;
            let mut maintain_bottom = 0;
            let possible = true;
            for i in 0..n {
                if tops[i] != x as i32 {
                    maintain_top += 1;
                }
                if bottoms[i] != x as i32 {
                    maintain_bottom += 1;
                }
            }
            if possible {
                res = res.min(maintain_top.min(maintain_bottom));
            }
        }
        if res == i32::MAX { -1 } else { res }
    }
}
