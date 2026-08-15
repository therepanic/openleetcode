public class Solution {
    public int EatenApples(int[] apples, int[] days) {
        var batches = new SortedDictionary<int, int>();
        int n = apples.Length;
        int res = 0;
        int day = 0;
        while (batches.Count > 0 || day < n) {
            if (day < n && apples[day] > 0) {
                int expire = day + days[day];
                if (batches.ContainsKey(expire)) batches[expire] += apples[day];
                else batches[expire] = apples[day];
            }
            while (batches.Count > 0 && batches.First().Key <= day) {
                batches.Remove(batches.First().Key);
            }
            if (batches.Count > 0) {
                int expire = batches.First().Key;
                res++;
                if (--batches[expire] == 0) batches.Remove(expire);
            }
            day++;
        }
        return res;
    }
}
