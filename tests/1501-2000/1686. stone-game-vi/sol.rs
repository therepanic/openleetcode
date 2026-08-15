impl Solution {
    pub fn stone_game_vi(alice_values: Vec<i32>, bob_values: Vec<i32>) -> i32 {
        let n = alice_values.len();
        let mut combined: Vec<(i32, i32, i32)> = (0..n).map(|i| {
            (alice_values[i] + bob_values[i], alice_values[i], bob_values[i])
        }).collect();
        combined.sort_by(|a, b| b.0.cmp(&a.0));

        let mut alice = 0;
        let mut bob = 0;
        for (i, &(_, a, b)) in combined.iter().enumerate() {
            if i % 2 == 0 {
                alice += a;
            } else {
                bob += b;
            }
        }

        if alice > bob {
            1
        } else if alice < bob {
            -1
        } else {
            0
        }
    }
}
