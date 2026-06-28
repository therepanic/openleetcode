impl Solution {
    pub fn flood_fill(mut image: Vec<Vec<i32>>, sr: i32, sc: i32, color: i32) -> Vec<Vec<i32>> {
        let old = image[sr as usize][sc as usize];
        if old == color {
            return image;
        }
        let m = image.len() as i32;
        let n = image[0].len() as i32;
        fn dfs(image: &mut Vec<Vec<i32>>, i: i32, j: i32, old: i32, color: i32, m: i32, n: i32) {
            if i < 0 || i >= m || j < 0 || j >= n || image[i as usize][j as usize] != old {
                return;
            }
            image[i as usize][j as usize] = color;
            dfs(image, i + 1, j, old, color, m, n);
            dfs(image, i - 1, j, old, color, m, n);
            dfs(image, i, j + 1, old, color, m, n);
            dfs(image, i, j - 1, old, color, m, n);
        }
        dfs(&mut image, sr, sc, old, color, m, n);
        image
    }
}
