function isRationalEqual(s: string, t: string): boolean {
  function gcd(a: bigint, b: bigint): bigint {
    while (b !== 0n) {
      [a, b] = [b, a % b];
    }
    return a > 0n ? a : -a;
  }

  function add(a: [bigint, bigint], b: [bigint, bigint]): [bigint, bigint] {
    const num = a[0] * b[1] + b[0] * a[1];
    const den = a[1] * b[1];
    const g = gcd(num > 0n ? num : -num, den > 0n ? den : -den);
    return [num / g, den / g];
  }

  function pow10(n: number): bigint {
    return 10n ** BigInt(n);
  }

  function parse(x: string): [bigint, bigint] {
    if (!x.includes(".")) {
      return [BigInt(x), 1n];
    }
    const [integer, frac] = x.split(".");
    if (!frac.includes("(")) {
      if (frac === "") {
        return [BigInt(integer), 1n];
      }
      return add([BigInt(integer), 1n], [BigInt(frac), pow10(frac.length)]);
    }
    const [nonrep, repWithParen] = frac.split("(");
    const rep = repWithParen.slice(0, -1);
    let base: [bigint, bigint] = [BigInt(integer), 1n];
    if (nonrep !== "") {
      base = add(base, [BigInt(nonrep), pow10(nonrep.length)]);
    }
    const repeatNum = BigInt(rep);
    const repeatDen = (pow10(rep.length) - 1n) * pow10(nonrep.length);
    return add(base, [repeatNum, repeatDen]);
  }

  const sf = parse(s);
  const tf = parse(t);
  return sf[0] * tf[1] === tf[0] * sf[1];
}
