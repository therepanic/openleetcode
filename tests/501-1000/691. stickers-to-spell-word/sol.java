class Solution {
    public int minStickers(String[] stickers, String target) {
        Map<String, Integer> memo = new HashMap<>();
        int result = dfs(stickers, target, 0, memo);
        return result == Integer.MAX_VALUE ? -1 : result;
    }
    
    private int dfs(String[] stickers, String target, int idx, Map<String, Integer> memo) {
        if (target.isEmpty()) {
            return 0;
        }
        if (idx == stickers.length) {
            return Integer.MAX_VALUE;
        }
        
        String key = idx + "," + target;
        if (memo.containsKey(key)) {
            return memo.get(key);
        }
        
        int result = dfs(stickers, target, idx + 1, memo);
        
        String currentSticker = stickers[idx];
        StringBuilder newTarget = new StringBuilder(target);
        boolean somethingRemoved = false;
        for (char c : currentSticker.toCharArray()) {
            int idxToRemove = newTarget.indexOf(String.valueOf(c));
            if (idxToRemove != -1) {
                newTarget.deleteCharAt(idxToRemove);
                somethingRemoved = true;
            }
        }
        
        if (somethingRemoved) {
            int subResult = dfs(stickers, newTarget.toString(), idx, memo);
            if (subResult != Integer.MAX_VALUE) {
                result = Math.min(result, 1 + subResult);
            }
        }
        
        memo.put(key, result);
        return result;
    }
}
