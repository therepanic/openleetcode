impl Solution {
    pub fn exclusive_time(n: i32, logs: Vec<String>) -> Vec<i32> {
        let mut callstack: Vec<Vec<i32>> = Vec::new();
        let mut exectime = vec![0; n as usize];
        
        for log in logs {
            let parts: Vec<&str> = log.split(':').collect();
            let idn: i32 = parts[0].parse().unwrap();
            let status = parts[1];
            let curtime: i32 = parts[2].parse().unwrap();
            
            if status == "start" {
                callstack.push(vec![idn, curtime]);
            } else {
                let top = callstack.pop().unwrap();
                let x = top[0] as usize;
                let y = top[1];
                let time = curtime - y + 1;
                exectime[x] += time;
                if !callstack.is_empty() {
                    let prev = callstack.last().unwrap()[0] as usize;
                    exectime[prev] -= time;
                }
            }
        }
        
        exectime
    }
}
