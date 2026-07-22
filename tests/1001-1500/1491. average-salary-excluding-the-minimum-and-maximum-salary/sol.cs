public class Solution {
    public double Average(int[] salary) {
        int max = salary[0];
        int min = salary[0];
        foreach (int s in salary) {
            if (s > max) max = s;
            if (s < min) min = s;
        }
        double total = 0.0;
        int count = 0;
        foreach (int s in salary) {
            if (s != max && s != min) {
                total += s;
                count++;
            }
        }
        return total / count;
    }
}
