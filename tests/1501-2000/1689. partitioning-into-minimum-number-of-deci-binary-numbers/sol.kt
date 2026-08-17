class Solution {
    fun minPartitions(n: String): Int {
        return n.maxOf { it - '0' }
    }
}
