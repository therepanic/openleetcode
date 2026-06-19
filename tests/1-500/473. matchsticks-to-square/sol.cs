public class Solution {
    public bool Makesquare(int[] matchsticks) {
        int total = matchsticks.Sum();
        if (total % 4 != 0) return false;
        int side = total / 4;
        
        Array.Sort(matchsticks, (a, b) => b.CompareTo(a));
        
        int[] sides = new int[4];
        return Backtrack(matchsticks, 0, sides, side);
    }
    
    private bool Backtrack(int[] matchsticks, int index, int[] sides, int side) {
        if (index == matchsticks.Length) {
            return sides[0] == side && sides[1] == side && sides[2] == side && sides[3] == side;
        }
        for (int i = 0; i < 4; i++) {
            if (sides[i] + matchsticks[index] <= side) {
                sides[i] += matchsticks[index];
                if (Backtrack(matchsticks, index + 1, sides, side)) return true;
                sides[i] -= matchsticks[index];
            }
        }
        return false;
    }
}
