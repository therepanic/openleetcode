impl Solution {
    pub fn corp_flight_bookings(bookings: Vec<Vec<i32>>, n: i32) -> Vec<i32> {
        let n = n as usize;
        let mut l = vec![0; n + 1];
        for i in bookings {
            let x = i[0] as usize;
            let y = i[1] as usize;
            l[x - 1] += i[2];
            l[y] -= i[2];
        }
        
        let mut s = Vec::with_capacity(n);
        for i in 0..n {
            if i == 0 {
                s.push(l[i]);
            } else {
                let prev = s[i - 1];
                s.push(prev + l[i]);
            }
        }
        s
    }
}
