class Solution {
    public boolean makesquare(int[] matchsticks) {
        int total = 0;
        for (int m : matchsticks) total += m;
        if (total % 4 != 0) return false;
        int side = total / 4;
        
        Integer[] arr = new Integer[matchsticks.length];
        for (int i = 0; i < matchsticks.length; i++) arr[i] = matchsticks[i];
        Arrays.sort(arr, (a, b) -> b - a);
        
        int[] sides = new int[4];
        return backtrack(arr, 0, sides, side);
    }
    
    private boolean backtrack(Integer[] matchsticks, int index, int[] sides, int side) {
        if (index == matchsticks.length) {
            return sides[0] == side && sides[1] == side && sides[2] == side && sides[3] == side;
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
