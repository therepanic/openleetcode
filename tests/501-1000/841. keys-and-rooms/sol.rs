impl Solution {
    pub fn can_visit_all_rooms(rooms: Vec<Vec<i32>>) -> bool {
        let n = rooms.len();
        let mut keys = vec![0];
        let mut visited = vec![false; n];
        visited[0] = true;
        let mut count = 1;
        while let Some(room) = keys.pop() {
            for &i in &rooms[room] {
                let i = i as usize;
                if !visited[i] {
                    visited[i] = true;
                    keys.push(i);
                    count += 1;
                }
            }
        }
        count == n
    }
}
