impl Solution {
    pub fn flip_and_invert_image(image: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut image = image;
        for row in image.iter_mut() {
            let mut left = 0usize;
            let mut right = row.len();
            while left < right {
                right -= 1;
                let temp = 1 - row[right];
                row[right] = 1 - row[left];
                row[left] = temp;
                left += 1;
            }
        }
        image
    }
}
