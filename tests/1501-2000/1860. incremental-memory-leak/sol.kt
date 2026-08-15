class Solution {
    fun memLeak(memory1: Int, memory2: Int): IntArray {
        var memory1 = memory1
        var memory2 = memory2
        var time = 1
        while (true) {
            if (memory1 >= memory2) {
                if (memory1 >= time) {
                    memory1 -= time
                } else {
                    break
                }
            } else {
                if (memory2 >= time) {
                    memory2 -= time
                } else {
                    break
                }
            }
            time++
        }
        return intArrayOf(time, memory1, memory2)
    }
}
