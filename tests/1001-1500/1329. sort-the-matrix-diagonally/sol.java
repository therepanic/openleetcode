import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class Solution {
    public int[][] diagonalSort(int[][] mat) {
        int m = mat.length, n = mat[0].length;
        Map<Integer, List<Integer>> diagonals = new HashMap<>();
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int key = i - j;
                diagonals.computeIfAbsent(key, k -> new ArrayList<>()).add(mat[i][j]);
            }
        }
        
        for (List<Integer> list : diagonals.values()) {
            list.sort((a, b) -> b - a);
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                List<Integer> list = diagonals.get(i - j);
                mat[i][j] = list.remove(list.size() - 1);
            }
        }
        
        return mat;
    }
}
