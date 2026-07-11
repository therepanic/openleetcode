class Solution {
  bool isRationalEqual(String s, String t) {
    BigInt gcd(BigInt a, BigInt b) {
      while (b != BigInt.zero) {
        var t = b;
        b = a % b;
        a = t;
      }
      return a;
    }

    List<BigInt> add(List<BigInt> a, List<BigInt> b) {
      var num = a[0] * b[1] + b[0] * a[1];
      var den = a[1] * b[1];
      var g = gcd(num.abs(), den.abs());
      return [num ~/ g, den ~/ g];
    }

    BigInt pow10(int n) {
      return BigInt.from(10).pow(n);
    }

    List<BigInt> parse(String x) {
      if (!x.contains('.')) {
        return [BigInt.parse(x), BigInt.one];
      }
      var parts = x.split('.');
      var integer = parts[0];
      var frac = parts[1];
      if (!frac.contains('(')) {
        if (frac.isEmpty) {
          return [BigInt.parse(integer), BigInt.one];
        }
        var base = [BigInt.parse(integer), BigInt.one];
        var fracPart = [BigInt.parse(frac), pow10(frac.length)];
        return add(base, fracPart);
      }
      var repParts = frac.split('(');
      var nonrep = repParts[0];
      var rep = repParts[1].substring(0, repParts[1].length - 1);
      var base = [BigInt.parse(integer), BigInt.one];
      if (nonrep.isNotEmpty) {
        base = add(base, [BigInt.parse(nonrep), pow10(nonrep.length)]);
      }
      var repeatNum = BigInt.parse(rep);
      var repeatDen = (pow10(rep.length) - BigInt.one) * pow10(nonrep.length);
      return add(base, [repeatNum, repeatDen]);
    }

    var sf = parse(s);
    var tf = parse(t);
    return sf[0] * tf[1] == tf[0] * sf[1];
  }
}
