impl Solution {
    pub fn paths_with_max_score(board: Vec<String>) -> Vec<i32> {
        const MOD: i32 = 1_000_000_007;
        let n = board.len();

        let mut next_score = vec![-1; n + 1];
        let mut next_ways = vec![0; n + 1];

        let board: Vec<Vec<char>> = board.into_iter().map(|s| s.chars().collect()).collect();

        for i in (0..n).rev() {
            let mut curr_score = vec![-1; n + 1];
            let mut curr_ways = vec![0; n + 1];

            let row = &board[i];
            for j in (0..n).rev() {
                let cell = row[j];

                if cell == 'X' {
                    continue;
                }

                if cell == 'S' {
                    curr_score[j] = 0;
                    curr_ways[j] = 1;
                    continue;
                }

                let best = next_score[j].max(curr_score[j + 1]).max(next_score[j + 1]);

                if best == -1 {
                    continue;
                }

                let mut ways = 0;

                if next_score[j] == best {
                    ways = (ways + next_ways[j]) % MOD;
                }
                if curr_score[j + 1] == best {
                    ways = (ways + curr_ways[j + 1]) % MOD;
                }
                if next_score[j + 1] == best {
                    ways = (ways + next_ways[j + 1]) % MOD;
                }

                let value = if cell == 'E' { 0 } else { cell.to_digit(10).unwrap() as i32 };

                curr_score[j] = best + value;
                curr_ways[j] = ways;
            }

            next_score = curr_score;
            next_ways = curr_ways;
        }

        if next_score[0] == -1 {
            return vec![0, 0];
        }

        vec![next_score[0], next_ways[0]]
    }
}
