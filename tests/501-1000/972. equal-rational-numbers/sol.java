class Solution {
    public boolean isRationalEqual(String s, String t) {
        return parse(s).equals(parse(t));
    }
    
    private static class Fraction {
        long num, den;
        Fraction(long n, long d) {
            if (d < 0) { n = -n; d = -d; }
            long g = gcd(Math.abs(n), Math.abs(d));
            num = n / g;
            den = d / g;
        }
        Fraction add(Fraction o) {
            return new Fraction(num * o.den + o.num * den, den * o.den);
        }
        public boolean equals(Object o) {
            if (!(o instanceof Fraction)) return false;
            Fraction f = (Fraction)o;
            return num == f.num && den == f.den;
        }
        static long gcd(long a, long b) { return b == 0 ? a : gcd(b, a % b); }
    }
    
    private Fraction parse(String x) {
        if (!x.contains(".")) {
            return new Fraction(Integer.parseInt(x), 1);
        }
        String[] parts = x.split("\\.", 2);
        String integer = parts[0];
        String frac = parts[1];
        if (!frac.contains("(")) {
            if (frac.isEmpty()) {
                return new Fraction(Integer.parseInt(integer), 1);
            }
            Fraction base = new Fraction(Integer.parseInt(integer), 1);
            Fraction fracPart = new Fraction(Integer.parseInt(frac), (long) Math.pow(10, frac.length()));
            return base.add(fracPart);
        }
        String[] repParts = frac.split("\\(", 2);
        String nonrep = repParts[0];
        String rep = repParts[1].substring(0, repParts[1].length() - 1);
        Fraction base = new Fraction(Integer.parseInt(integer), 1);
        if (!nonrep.isEmpty()) {
            base = base.add(new Fraction(Integer.parseInt(nonrep), (long) Math.pow(10, nonrep.length())));
        }
        long repeatNum = Long.parseLong(rep);
        long repeatDen = ((long) Math.pow(10, rep.length()) - 1) * (long) Math.pow(10, nonrep.length());
        return base.add(new Fraction(repeatNum, repeatDen));
    }
}
