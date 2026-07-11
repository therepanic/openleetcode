import java.util.*;

class Solution {
    public int[] gridIllumination(int n, int[][] lamps, int[][] queries) {
        Map<Integer, Integer> rowCount = new HashMap<>();
        Map<Integer, Integer> colCount = new HashMap<>();
        Map<Integer, Integer> diag1 = new HashMap<>();
        Map<Integer, Integer> diag2 = new HashMap<>();
        Set<Long> lampSet = new HashSet<>();
        int[] ans = new int[queries.length];
        int[][] dirs = {{-1,-1}, {-1,0}, {-1,1}, {0,-1}, {0,0}, {0,1}, {1,-1}, {1,0}, {1,1}};
        
        for (int[] lamp : lamps) {
            int r = lamp[0], c = lamp[1];
            long key = (long)r << 32 | (c & 0xFFFFFFFFL);
            if (!lampSet.contains(key)) {
                lampSet.add(key);
                rowCount.merge(r, 1, Integer::sum);
                colCount.merge(c, 1, Integer::sum);
                diag1.merge(r - c, 1, Integer::sum);
                diag2.merge(r + c, 1, Integer::sum);
            }
        }
        
        for (int i = 0; i < queries.length; i++) {
            int r = queries[i][0], c = queries[i][1];
            if (rowCount.getOrDefault(r, 0) > 0 || 
                colCount.getOrDefault(c, 0) > 0 || 
                diag1.getOrDefault(r - c, 0) > 0 || 
                diag2.getOrDefault(r + c, 0) > 0) {
                ans[i] = 1;
                for (int[] d : dirs) {
                    int nr = r + d[0], nc = c + d[1];
                    long key = (long)nr << 32 | (nc & 0xFFFFFFFFL);
                    if (lampSet.contains(key)) {
                        lampSet.remove(key);
                        rowCount.merge(nr, -1, Integer::sum);
                        colCount.merge(nc, -1, Integer::sum);
                        diag1.merge(nr - nc, -1, Integer::sum);
                        diag2.merge(nr + nc, -1, Integer::sum);
                    }
                }
            } else {
                ans[i] = 0;
            }
        }
        return ans;
    }
}
