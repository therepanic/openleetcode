public class Solution {
    public int FindMaxValueOfEquation(int[][] points, int k) {
        var window = new System.Collections.Generic.LinkedList<(int value, int x)>();
        int answer = int.MinValue;
        foreach (var point in points) {
            int x = point[0];
            int y = point[1];
            while (window.Count > 0 && x - window.First.Value.x > k) {
                window.RemoveFirst();
            }
            if (window.Count > 0) {
                answer = Math.Max(answer, x + y + window.First.Value.value);
            }
            int value = y - x;
            while (window.Count > 0 && window.Last.Value.value <= value) {
                window.RemoveLast();
            }
            window.AddLast((value, x));
        }
        return answer;
    }
}
