impl Solution {
    pub fn max_compatibility_sum(students: Vec<Vec<i32>>, mentors: Vec<Vec<i32>>) -> i32 {
        let m = students.len();
        let mut max_score = 0;
        let mut perm: Vec<usize> = (0..m).collect();
        loop {
            let mut total = 0;
            for i in 0..m {
                for j in 0..students[i].len() {
                    if students[i][j] == mentors[perm[i]][j] { total += 1; }
                }
            }
            max_score = max_score.max(total);
            if !Self::next_permutation(&mut perm) { break; }
        }
        max_score
    }
    
    fn next_permutation(a: &mut Vec<usize>) -> bool {
        let n = a.len();
        let mut i = n as i32 - 2;
        while i >= 0 && a[i as usize] >= a[(i+1) as usize] { i -= 1; }
        if i < 0 { return false; }
        let mut j = n as i32 - 1;
        while a[j as usize] <= a[i as usize] { j -= 1; }
        a.swap(i as usize, j as usize);
        let mut l = (i+1) as usize;
        let mut r = n - 1;
        while l < r {
            a.swap(l, r);
            l += 1; r -= 1;
        }
        true
    }
}
