impl Solution {
    pub fn loud_and_rich(richer: Vec<Vec<i32>>, quiet: Vec<i32>) -> Vec<i32> {
        let n = quiet.len();
        let mut graph = vec![vec![]; n];
        for pair in &richer {
            graph[pair[1] as usize].push(pair[0] as usize);
        }
        
        let mut answer = vec![-1; n];
        
        fn dfs(i: usize, graph: &Vec<Vec<usize>>, quiet: &Vec<i32>, answer: &mut Vec<i32>) -> usize {
            if answer[i] != -1 {
                return answer[i] as usize;
            }
            answer[i] = i as i32;
            for &nei in &graph[i] {
                let item = dfs(nei, graph, quiet, answer);
                if quiet[item] < quiet[answer[i] as usize] {
                    answer[i] = item as i32;
                }
            }
            answer[i] as usize
        }
        
        for i in 0..n {
            dfs(i, &graph, &quiet, &mut answer);
        }
        answer
    }
}
