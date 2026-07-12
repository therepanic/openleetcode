function defangIPaddr(address: string): string {
  let s = "";
  for (const i of address) {
    if (i === ".") {
      s += "[.]";
    } else {
      s += i;
    }
  }
  return s;
}
