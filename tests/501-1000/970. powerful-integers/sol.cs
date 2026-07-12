public class Solution {
    public IList<int> PowerfulIntegers(int x, int y, int bound) {
        HashSet<int> result = new HashSet<int>();
        int i = 1;

        while (i <= bound) {
            int j = 1;
            while (i + j <= bound) {
                result.Add(i + j);
                if (y == 1) break;
                j *= y;
            }
            if (x == 1) break;
            i *= x;
        }
        
        return result.ToList();
    }
}
