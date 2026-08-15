function maximumNumber(num: string, change: number[]): string {
  let a = num.split("");
  let flag = false;
  for (let i = 0; i < a.length; i++) {
    let b = parseInt(a[i]);
    if (b < change[b]) {
      a[i] = change[b].toString();
      flag = true;
    } else if (b === change[b] || !flag) {
      continue;
    } else {
      break;
    }
  }
  return a.join("");
}
