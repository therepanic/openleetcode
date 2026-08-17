impl Solution {
    pub fn count_students(students: Vec<i32>, sandwiches: Vec<i32>) -> i32 {
        let mut s = students.clone();
        let mut sw = sandwiches.clone();
        let mut c = 0;
        while !s.is_empty() {
            if s[0] == sw[0] {
                sw.remove(0);
                s.remove(0);
                c = 0;
            } else {
                let front = s.remove(0);
                s.push(front);
                c += 1;
            }
            if c == s.len() { break; }
        }
        s.len() as i32
    }
}
