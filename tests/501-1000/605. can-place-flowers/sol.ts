function canPlaceFlowers(flowerbed: number[], n: number): boolean {
  if (n === 0) return true;
  const length = flowerbed.length;
  for (let i = 0; i < length; i++) {
    if (flowerbed[i] === 0) {
      const left = i === 0 || flowerbed[i - 1] === 0;
      const right = i === length - 1 || flowerbed[i + 1] === 0;
      if (left && right) {
        flowerbed[i] = 1;
        n--;
        if (n === 0) return true;
      }
    }
  }
  return false;
}
