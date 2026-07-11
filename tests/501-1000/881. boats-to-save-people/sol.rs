impl Solution {
    pub fn num_rescue_boats(people: Vec<i32>, limit: i32) -> i32 {
        let mut people = people;
        people.sort();
        let mut start = 0;
        let mut end = people.len() as i32 - 1;
        let mut boats = 0;
        
        while start <= end {
            if people[start as usize] + people[end as usize] <= limit {
                start += 1;
                end -= 1;
            } else {
                end -= 1;
            }
            boats += 1;
        }
        
        boats
    }
}
