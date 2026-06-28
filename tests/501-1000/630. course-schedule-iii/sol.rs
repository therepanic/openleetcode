impl Solution {
    pub fn schedule_course(courses: Vec<Vec<i32>>) -> i32 {
        let mut courses = courses;
        courses.sort_by(|a, b| a[1].cmp(&b[1]).then(a[0].cmp(&b[0])));
        let mut heap = std::collections::BinaryHeap::new();
        let mut days = 0;
        for course in courses {
            let duration = course[0];
            let last = course[1];
            days += duration;
            heap.push(duration);
            if days > last {
                if let Some(top) = heap.pop() {
                    days -= top;
                }
            }
        }
        heap.len() as i32
    }
}
