impl Solution {
    pub fn outer_trees(trees: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        if trees.len() == 1 {
            return trees;
        }

        fn cross(o: &Vec<i32>, a: &Vec<i32>, b: &Vec<i32>) -> i32 {
            (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
        }

        let mut trees = trees;
        trees.sort_by(|a, b| {
            if a[0] == b[0] {
                a[1].cmp(&b[1])
            } else {
                a[0].cmp(&b[0])
            }
        });

        let mut lower: Vec<Vec<i32>> = Vec::new();
        for p in &trees {
            while lower.len() >= 2 && cross(&lower[lower.len() - 2], &lower[lower.len() - 1], p) < 0 {
                lower.pop();
            }
            lower.push(p.clone());
        }

        let mut upper: Vec<Vec<i32>> = Vec::new();
        for p in trees.iter().rev() {
            while upper.len() >= 2 && cross(&upper[upper.len() - 2], &upper[upper.len() - 1], p) < 0 {
                upper.pop();
            }
            upper.push(p.clone());
        }

        lower.pop();
        upper.pop();
        lower.append(&mut upper);

        let mut seen = std::collections::HashSet::new();
        let mut result = Vec::new();
        for p in lower {
            let key = format!("{},{}", p[0], p[1]);
            if !seen.contains(&key) {
                seen.insert(key);
                result.push(p);
            }
        }

        result
    }
}
