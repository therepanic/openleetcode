public class Solution {
    public int GetKth(int lo, int hi, int k) {
        var vc = new List<(int, int)>();
        for (int i = lo; i <= hi; i++) {
            int num = i;
            int count = 0;
            while (num != 1) {
                if (num % 2 == 0) {
                    num /= 2;
                } else {
                    num = 3 * num + 1;
                }
                count++;
            }
            vc.Add((i, count));
        }
        vc.Sort((a, b) => {
            if (a.Item2 != b.Item2) return a.Item2.CompareTo(b.Item2);
            return a.Item1.CompareTo(b.Item1);
        });
        return vc[k - 1].Item1;
    }
}
