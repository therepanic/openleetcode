class Solution {
  bool makesquare(List<int> matchsticks) {
    int total = matchsticks.fold(0, (a, b) => a + b);
    if (total % 4 != 0) return false;
    int side = total ~/ 4;
    
    matchsticks.sort((a, b) => b - a);
    
    List<int> sides = [0, 0, 0, 0];
    return backtrack(matchsticks, 0, sides, side);
  }
  
  bool backtrack(List<int> matchsticks, int index, List<int> sides, int side) {
    if (index == matchsticks.length) {
      return sides.every((s) => s == side);
    }
    for (int i = 0; i < 4; i++) {
      if (sides[i] + matchsticks[index] <= side) {
        sides[i] += matchsticks[index];
        if (backtrack(matchsticks, index + 1, sides, side)) return true;
        sides[i] -= matchsticks[index];
      }
    }
    return false;
  }
}
