public class Solution {
    private bool Invalid(string x) {
        if (x[0] == '0' && x.Length > 1) return true;
        if (x.Length > 10) return true;
        return long.TryParse(x, out long value) ? value >= (1L << 31) : true;
    }
    
    private IList<int> Check(string a0, string a1, string num) {
        int i = 0;
        var ret = new List<int> { int.Parse(a0), int.Parse(a1) };
        string curA0 = a0, curA1 = a1;
        while (i < num.Length) {
            long a0Val = long.Parse(curA0);
            long a1Val = long.Parse(curA1);
            string res = (a0Val + a1Val).ToString();
            int j = 0;
            while (i < num.Length && j < res.Length && res[j] == num[i]) {
                j++;
                i++;
            }
            if (j < res.Length || Invalid(res)) return new List<int>();
            curA0 = curA1;
            curA1 = res;
            ret.Add(int.Parse(res));
        }
        return ret;
    }
    
    public IList<int> SplitIntoFibonacci(string num) {
        int n = num.Length;
        for (int j = 1; j < n - 1; j++) {
            for (int i = 0; i < j; i++) {
                string a0 = num.Substring(0, i + 1);
                string a1 = num.Substring(i + 1, j - i);
                if (Invalid(a0) || Invalid(a1)) continue;
                IList<int> ret = Check(a0, a1, num.Substring(j + 1));
                if (ret.Count > 0) return ret;
            }
        }
        return new List<int>();
    }
}
