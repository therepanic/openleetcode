public class Solution {
    public int[][] IntervalIntersection(int[][] firstList, int[][] secondList) {
        if (firstList.Length == 0 || secondList.Length == 0) {
            return new int[0][];
        }
        
        int n = firstList.Length, m = secondList.Length;
        List<int[]> res = new List<int[]>();
        int i = 0, j = 0;
        
        while (i < n && j < m) {
            int s1 = firstList[i][0], e1 = firstList[i][1];
            int s2 = secondList[j][0], e2 = secondList[j][1];
            
            if (e1 >= s2 && s1 <= e2) {
                res.Add(new int[]{Math.Max(s1, s2), Math.Min(e1, e2)});
            }
            
            if (e1 > e2) {
                j++;
            } else {
                i++;
            }
        }
        
        return res.ToArray();
    }
}
