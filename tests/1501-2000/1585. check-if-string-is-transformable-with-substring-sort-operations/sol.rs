impl Solution {
    pub fn is_transformable(s: String, t: String) -> bool {
        let mut sc: Vec<char> = s.chars().collect();
        let mut tc: Vec<char> = t.chars().collect();
        sc.sort();
        tc.sort();
        if sc != tc { return false; }
        
        let mut pos: Vec<Vec<usize>> = vec![Vec::new(); 10];
        for (i, ch) in s.chars().enumerate() {
            pos[ch.to_digit(10).unwrap() as usize].push(i);
        }
            
        for ch in t.chars() {
            let dig = ch.to_digit(10).unwrap() as usize;
            let i = pos[dig].remove(0);
            for ii in 0..dig {
                if !pos[ii].is_empty() && pos[ii][0] < i { return false; }
            }
        }
        true
    }
}
