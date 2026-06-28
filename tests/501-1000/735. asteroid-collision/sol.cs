public class Solution {
    public int[] AsteroidCollision(int[] asteroids) {
        var res = new List<int>();
        foreach (int a in asteroids) {
            bool destroyed = false;
            while (res.Count > 0 && a < 0 && res[res.Count - 1] > 0) {
                if (-a > res[res.Count - 1]) {
                    res.RemoveAt(res.Count - 1);
                    continue;
                } else if (-a == res[res.Count - 1]) {
                    res.RemoveAt(res.Count - 1);
                }
                destroyed = true;
                break;
            }
            if (!destroyed) {
                res.Add(a);
            }
        }
        return res.ToArray();
    }
}
