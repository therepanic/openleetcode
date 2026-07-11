function strWithout3a3b(a: number, b: number): string {
  let res = "";
  let prev_a = 0;
  let prev_b = 0;

  while (a > 0 || b > 0) {
    if (prev_a === 2 && b > 0) {
      res += "b";
      b--;
      prev_b++;
      prev_a = 0;
    } else if (prev_b === 2 && a > 0) {
      res += "a";
      a--;
      prev_a++;
      prev_b = 0;
    } else if (a > b && a > 0) {
      res += "a";
      a--;
      prev_a++;
    } else if (b > 0) {
      res += "b";
      b--;
      prev_b++;
    }
  }
  return res;
}
