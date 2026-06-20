function findComplement(num: number): number {
  let bit = 1;
  let curr = num;
  while (curr > 0) {
    num ^= bit;
    bit <<= 1;
    curr >>= 1;
  }
  return num;
}
