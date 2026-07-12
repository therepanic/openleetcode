class Solution {
  int numTilePossibilities(String tiles) {
    var arr = tiles.split('')..sort();
    var used = List.filled(arr.length, false);
    return backtrack(arr, used);
  }
  
  int backtrack(List<String> tiles, List<bool> used) {
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
