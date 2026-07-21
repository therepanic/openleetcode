impl Solution {
    pub fn critical_connections(n: i32, connections: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let n = n as usize;
        let mut graph: Vec<Vec<i32>> = vec![Vec::new(); n];
        for edge in &connections {
            let u = edge[0] as usize;
            let v = edge[1] as usize;
            graph[u].push(v as i32);
            graph[v].push(u as i32);
        }
        
        let mut disc: Vec<i32> = vec![-1; n];
        let mut low: Vec<i32> = vec![0; n];
        let mut timer = 0;
        let mut bridges: Vec<Vec<i32>> = Vec::new();
        let mut iter_idx: Vec<usize> = vec![0; n];
        
        for start in 0..n {
            if disc[start] != -1 {
                continue;
            }
            
            let mut stack: Vec<(usize, i32)> = Vec::new();
            disc[start] = timer;
            low[start] = timer;
            timer += 1;
            stack.push((start, -1));
            
            while !stack.is_empty() {
                let (node, parent) = *stack.last().unwrap();
                let neighbors = &graph[node];
                
                if iter_idx[node] < neighbors.len() {
                    let nb = neighbors[iter_idx[node]] as usize;
                    iter_idx[node] += 1;
                    if nb as i32 == parent {
                        continue;
                    }
                    
                    if disc[nb] == -1 {
                        disc[nb] = timer;
                        low[nb] = timer;
                        timer += 1;
                        stack.push((nb, node as i32));
                    } else {
                        low[node] = low[node].min(disc[nb]);
                    }
                } else {
                    stack.pop();
                    if !stack.is_empty() {
                        let par = stack.last().unwrap().0;
                        low[par] = low[par].min(low[node]);
                        if low[node] > disc[par] {
                            bridges.push(vec![par as i32, node as i32]);
                        }
                    }
                }
            }
        }
        
        bridges
    }
}
