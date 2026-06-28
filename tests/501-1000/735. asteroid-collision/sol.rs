impl Solution {
    pub fn asteroid_collision(asteroids: Vec<i32>) -> Vec<i32> {
        let mut res: Vec<i32> = Vec::new();
        for a in asteroids {
            let mut destroyed = false;
            while let Some(&top) = res.last() {
                if a < 0 && top > 0 {
                    if -a > top {
                        res.pop();
                        continue;
                    } else if -a == top {
                        res.pop();
                    }
                    destroyed = true;
                }
                break;
            }
            if !destroyed {
                res.push(a);
            }
        }
        res
    }
}
