function isValidSerialization(preorder: string): boolean {
  let slots = 1;
  for (const node of preorder.split(",")) {
    slots--;
    if (slots < 0) return false;
    if (node !== "#") slots += 2;
  }
  return slots === 0;
}
