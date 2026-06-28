public class Solution {
    public bool EscapeGhosts(int[][] ghosts, int[] target) {
        int[] a = new int[ghosts.Length];
        for (int i = 0; i < ghosts.Length; i++) {
            a[i] = Math.Abs(ghosts[i][0] - target[0]) + Math.Abs(ghosts[i][1] - target[1]);
        }
        
        int z = Math.Abs(target[0] - 0) + Math.Abs(target[1] - 0);
        
        bool ans = true;
        foreach (int i in a) {
            if (i <= z) {
                ans = false;
            }
        }
        
        return ans;
    }
}
