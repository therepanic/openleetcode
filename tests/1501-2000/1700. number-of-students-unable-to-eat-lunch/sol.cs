public class Solution {
    public int CountStudents(int[] students, int[] sandwiches) {
        var s = new System.Collections.Generic.List<int>(students);
        var sw = new System.Collections.Generic.List<int>(sandwiches);
        int c = 0;
        while (s.Count > 0) {
            if (s[0] == sw[0]) {
                sw.RemoveAt(0);
                s.RemoveAt(0);
                c = 0;
            } else {
                int front = s[0];
                s.RemoveAt(0);
                s.Add(front);
                c++;
            }
            if (c == s.Count) break;
        }
        return s.Count;
    }
}
