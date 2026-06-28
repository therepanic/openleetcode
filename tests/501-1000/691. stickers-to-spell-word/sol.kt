class Solution {
    fun minStickers(stickers: Array<String>, target: String): Int {
        val memo = HashMap<String, Int>()
        val result = dfs(stickers, target, 0, memo)
        return if (result == Int.MAX_VALUE) -1 else result
    }
    
    private fun dfs(stickers: Array<String>, target: String, idx: Int, memo: HashMap<String, Int>): Int {
        if (target.isEmpty()) return 0
        if (idx == stickers.size) return Int.MAX_VALUE
        
        val key = "$idx,$target"
        if (memo.containsKey(key)) return memo[key]!!
        
        var result = dfs(stickers, target, idx + 1, memo)
        
        val currentSticker = stickers[idx]
        val newTarget = StringBuilder(target)
        var somethingRemoved = false
        for (c in currentSticker) {
            val idxToRemove = newTarget.indexOf(c)
            if (idxToRemove != -1) {
                newTarget.deleteCharAt(idxToRemove)
                somethingRemoved = true
            }
        }
        
        if (somethingRemoved) {
            val subResult = dfs(stickers, newTarget.toString(), idx, memo)
            if (subResult != Int.MAX_VALUE) {
                result = minOf(result, 1 + subResult)
            }
        }
        
        memo[key] = result
        return result
    }
}
