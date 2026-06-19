function validUtf8(data: number[]): boolean {
  let i = 0;
  while (i < data.length) {
    const b = data[i];
    if (b >> 7 === 0) {
      i++;
    } else if (b >> 5 === 0b110) {
      if (i + 1 >= data.length) return false;
      if (data[i + 1] >> 6 !== 0b10) return false;
      i += 2;
    } else if (b >> 4 === 0b1110) {
      if (i + 2 >= data.length) return false;
      if (data[i + 1] >> 6 !== 0b10 || data[i + 2] >> 6 !== 0b10) return false;
      i += 3;
    } else if (b >> 3 === 0b11110) {
      if (i + 3 >= data.length) return false;
      if (
        data[i + 1] >> 6 !== 0b10 ||
        data[i + 2] >> 6 !== 0b10 ||
        data[i + 3] >> 6 !== 0b10
      )
        return false;
      i += 4;
    } else {
      return false;
    }
  }
  return true;
}
