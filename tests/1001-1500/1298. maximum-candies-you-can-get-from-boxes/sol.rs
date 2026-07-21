impl Solution {
    pub fn max_candies(mut status: Vec<i32>, candies: Vec<i32>, keys: Vec<Vec<i32>>, contained_boxes: Vec<Vec<i32>>, initial_boxes: Vec<i32>) -> i32 {
        let mut owned: HashSet<i32> = initial_boxes.into_iter().collect();
        let mut opened: HashSet<i32> = HashSet::new();
        let mut changed = true;
        let mut total_candies = 0;
        while changed {
            changed = false;
            let owned_list: Vec<i32> = owned.iter().cloned().collect();
            for box_id in owned_list {
                if opened.contains(&box_id) || status[box_id as usize] == 0 {
                    continue;
                }
                opened.insert(box_id);
                changed = true;
                total_candies += candies[box_id as usize];
                for &key_id in &keys[box_id as usize] {
                    status[key_id as usize] = 1;
                }
                for &contained_box in &contained_boxes[box_id as usize] {
                    owned.insert(contained_box);
                }
            }
        }
        total_candies
    }
}
