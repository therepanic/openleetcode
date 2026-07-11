class Solution {
    public int[][] intervalIntersection(int[][] firstList, int[][] secondList) {
        if (firstList.length == 0 || secondList.length == 0) {
            return new int[0][0];
        }
        
        int n = firstList.length, m = secondList.length;
        List<int[]> res = new ArrayList<>();
        int i = 0, j = 0;
        
        while (i < n && j < m) {
            int s1 = firstList[i][0], e1 = firstList[i][1];
            int s2 = secondList[j][0], e2 = secondList[j][1];
            
            if (e1 >= s2 && s1 <= e2) {
                res.add(new int[]{Math.max(s1, s2), Math.min(e1, e2)});
            }
            
            if (e1 > e2) {
                j++;
            } else {
                i++;
            }
        }
        
        return res.toArray(new int[res.size()][]);
    }
}
