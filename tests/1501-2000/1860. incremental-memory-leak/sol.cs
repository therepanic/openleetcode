public class Solution {
    public int[] MemLeak(int memory1, int memory2) {
        int time = 1;
        while (true) {
            if (memory1 >= memory2) {
                if (memory1 >= time) {
                    memory1 -= time;
                } else {
                    break;
                }
            } else {
                if (memory2 >= time) {
                    memory2 -= time;
                } else {
                    break;
                }
            }
            time++;
        }
        return new int[] { time, memory1, memory2 };
    }
}
