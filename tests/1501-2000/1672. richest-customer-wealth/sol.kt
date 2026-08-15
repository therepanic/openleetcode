class Solution {
    fun maximumWealth(accounts: Array<IntArray>): Int {
        var rich = 0
        for (i in accounts) {
            rich = maxOf(rich, i.sum())
        }
        return rich
    }
}
