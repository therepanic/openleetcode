impl Solution {
    pub fn mem_leak(memory1: i32, memory2: i32) -> Vec<i32> {
        let mut mem1 = memory1;
        let mut mem2 = memory2;
        let mut time = 1;
        loop {
            if mem1 >= mem2 {
                if mem1 >= time {
                    mem1 -= time;
                } else {
                    break;
                }
            } else {
                if mem2 >= time {
                    mem2 -= time;
                } else {
                    break;
                }
            }
            time += 1;
        }
        vec![time, mem1, mem2]
    }
}
