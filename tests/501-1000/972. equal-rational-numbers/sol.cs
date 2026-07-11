public class Solution {
    public bool IsRationalEqual(string s, string t) {
        (long, long) Parse(string x) {
            if (!x.Contains('.')) {
                return (long.Parse(x), 1);
            }
            var parts = x.Split('.', 2);
            var integer = parts[0];
            var frac = parts[1];
            if (!frac.Contains('(')) {
                if (frac == "") {
                    return (long.Parse(integer), 1);
                }
                var baseFrac = (long.Parse(integer), 1L);
                var fracPart = (long.Parse(frac), (long)Math.Pow(10, frac.Length));
                return Add(baseFrac, fracPart);
            }
            var repParts = frac.Split('(', 2);
            var nonrep = repParts[0];
            var rep = repParts[1].TrimEnd(')');
            var baseVal = (long.Parse(integer), 1L);
            if (nonrep != "") {
                baseVal = Add(baseVal, (long.Parse(nonrep), (long)Math.Pow(10, nonrep.Length)));
            }
            long repeatNum = long.Parse(rep);
            long repeatDen = ((long)Math.Pow(10, rep.Length) - 1) * (long)Math.Pow(10, nonrep.Length);
            return Add(baseVal, (repeatNum, repeatDen));
        }

        (long, long) Add((long, long) a, (long, long) b) {
            long num = a.Item1 * b.Item2 + b.Item1 * a.Item2;
            long den = a.Item2 * b.Item2;
            long g = Gcd(Math.Abs(num), Math.Abs(den));
            return (num / g, den / g);
        }

        long Gcd(long a, long b) {
            while (b != 0) {
                var t = b;
                b = a % b;
                a = t;
            }
            return a;
        }

        var sf = Parse(s);
        var tf = Parse(t);
        return sf.Item1 * tf.Item2 == tf.Item1 * sf.Item2;
    }
}
