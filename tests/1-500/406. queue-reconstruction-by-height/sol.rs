impl Solution {
    pub fn reconstruct_queue(people: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut people = people;
        people.sort_by(|a, b| {
            if a[0] != b[0] {
                b[0].cmp(&a[0])
            } else {
                a[1].cmp(&b[1])
            }
        });
        let mut q = Vec::new();
        for p in people {
            q.insert(p[1] as usize, p);
        }
        q
    }
}
