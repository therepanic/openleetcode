function canChoose(groups: number[][], nums: number[]): boolean {
  let i = 0;
  for (const group of groups) {
    let found = false;
    while (i + group.length <= nums.length) {
      let match = true;
      for (let j = 0; j < group.length; j++) {
        if (nums[i + j] !== group[j]) {
          match = false;
          break;
        }
      }
      if (match) {
        i += group.length;
        found = true;
        break;
      } else {
        i++;
      }
    }
    if (!found) return false;
  }
  return true;
}
