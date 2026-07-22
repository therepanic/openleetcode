impl Solution {
    pub fn alphabet_board_path(target: String) -> String {
        let arr: Vec<Vec<i32>> = vec![vec![0,1,2,3,4],vec![5,6,7,8,9],vec![10,11,12,13,14],vec![15,16,17,18,19],vec![20,21,22,23,24],vec![25]];
        let word: Vec<i32> = target.chars().map(|c| c as i32 - 'a' as i32).collect();
        let mut s = String::new();
        let mut j: i32 = 0;
        let mut k: i32 = 0;
        if word[0] % 5 != 0 {
            s.push_str(&"D".repeat((word[0] / 5) as usize));
        } else {
            s.push_str(&"D".repeat((word[0] / 5) as usize));
        }
        if word[0] % 5 >= 0 {
            s.push_str(&"R".repeat((word[0] % 5) as usize));
        }
        s.push('!');
        for i in 1..word.len() {
            for h in 0..arr.len() {
                for l in 0..arr[h].len() {
                    if arr[h][l] == word[i-1] { j = h as i32; }
                    if arr[h][l] == word[i] { k = h as i32; }
                }
            }
            if word[i-1] == 25 {
                if j > k {
                    s.push_str(&"U".repeat((j - k) as usize));
                } else {
                    s.push_str(&"D".repeat((k - j) as usize));
                }
                if word[i] % 5 >= word[i-1] % 5 {
                    s.push_str(&"R".repeat((word[i] % 5 - word[i-1] % 5) as usize));
                } else {
                    s.push_str(&"L".repeat((word[i-1] % 5 - word[i] % 5) as usize));
                }
            } else {
                if word[i] % 5 >= word[i-1] % 5 {
                    s.push_str(&"R".repeat((word[i] % 5 - word[i-1] % 5) as usize));
                } else {
                    s.push_str(&"L".repeat((word[i-1] % 5 - word[i] % 5) as usize));
                }
                if j > k {
                    s.push_str(&"U".repeat((j - k) as usize));
                } else {
                    s.push_str(&"D".repeat((k - j) as usize));
                }
            }
            s.push('!');
        }
        s
    }
}
