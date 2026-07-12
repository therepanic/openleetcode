public class Solution {
    public int NumTilePossibilities(string tiles) {
        char[] arr = tiles.ToCharArray();
        Array.Sort(arr);
        bool[] used = new bool[arr.Length];
        return Backtrack(arr, used);
    }
    
    private int Backtrack(char[] tiles, bool[] used) {
        int count = 0;
        for (int i = 0; i < tiles.Length; i++) {
            if (used[i] || (i > 0 && tiles[i] == tiles[i - 1] && !used[i - 1])) {
                continue;
            }
            used[i] = true;
            count += 1 + Backtrack(tiles, used);
            used[i] = false;
        }
        return count;
    }
}
