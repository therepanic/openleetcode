function nthUglyNumber(n: number, a: number, b: number, c: number): number {
  function gcd(x: number, y: number): number {
    while (y !== 0) {
      const temp = y;
      y = x % y;
      x = temp;
    }
    return x;
  }

  function lcm(x: number, y: number): number {
    return Math.floor((x * y) / gcd(x, y));
  }

  const ab: number = lcm(a, b);
  const ac: number = lcm(a, c);
  const bc: number = lcm(b, c);
  const abc: number = lcm(ab, c);

  let left: number = 1;
  let right: number = 2000000000;

  while (left < right) {
    const mid: number = Math.floor(left + (right - left) / 2);
    const cnt: number =
      Math.floor(mid / a) +
      Math.floor(mid / b) +
      Math.floor(mid / c) -
      Math.floor(mid / ab) -
      Math.floor(mid / ac) -
      Math.floor(mid / bc) +
      Math.floor(mid / abc);
    if (cnt >= n) {
      right = mid;
    } else {
      left = mid + 1;
    }
  }

  return left;
}
