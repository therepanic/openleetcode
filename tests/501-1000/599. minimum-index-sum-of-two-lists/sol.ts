function findRestaurant(list1: string[], list2: string[]): string[] {
  const mp: Map<string, number> = new Map();
  mp.set(list1[0], -Infinity);
  for (let i = 1; i < list1.length; i++) {
    mp.set(list1[i], -i);
  }
  if (!mp.has(list2[0])) {
    mp.set(list2[0], -Infinity);
  } else {
    if (mp.get(list2[0]) !== -Infinity) {
      mp.set(list2[0], Math.abs(mp.get(list2[0])!));
    } else {
      mp.set(list2[0], 0);
    }
  }
  for (let i = 1; i < list2.length; i++) {
    if (mp.has(list2[i])) {
      if (mp.get(list2[i]) !== -Infinity) {
        mp.set(list2[i], Math.abs(mp.get(list2[i])!) + i);
      } else {
        mp.set(list2[i], i);
      }
    } else {
      mp.set(list2[i], -i);
    }
  }
  let minVal = Infinity;
  for (const val of mp.values()) {
    if (val >= 0) {
      minVal = Math.min(minVal, val);
    }
  }
  const ans: string[] = [];
  mp.forEach((val, key) => {
    if (val >= 0 && val === minVal) {
      ans.push(key);
    }
  });
  return ans;
}
