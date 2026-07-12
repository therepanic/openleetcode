class Solution {
    public int numTilePossibilities(String tiles) {
        char[] arr = tiles.toCharArray();
        java.util.Arrays.sort(arr);
        boolean[] used = new boolean[arr.length];
        return backtrack(arr, used);
    }
    
    private int backtrack(char[] tiles, boolean[] used) {
        int count = 0;
        for (int i = 0; i < tiles.length; i++) {
            if (used[i] || (i > 0 && tiles[i] == tiles[i - 1] && !used[i - 1])) {
                continue;
            }
            used[i] = true;
            count += 1 + backtrack(tiles, used);
            used[i] = false;
        }
        return count;
    }
}
