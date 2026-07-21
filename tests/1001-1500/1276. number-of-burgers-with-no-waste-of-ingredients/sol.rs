impl Solution {
    pub fn num_of_burgers(tomato_slices: i32, cheese_slices: i32) -> Vec<i32> {
        if (tomato_slices - 2 * cheese_slices) % 2 != 0 {
            return vec![];
        }

        let x = (tomato_slices - 2 * cheese_slices) / 2;
        let y = cheese_slices - x;

        if x < 0 || y < 0 {
            return vec![];
        }

        vec![x, y]
    }
}
