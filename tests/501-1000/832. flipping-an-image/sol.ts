function flipAndInvertImage(image: number[][]): number[][] {
  for (const row of image) {
    let left = 0,
      right = row.length - 1;
    while (left <= right) {
      const temp = 1 - row[right];
      row[right] = 1 - row[left];
      row[left] = temp;
      left++;
      right--;
    }
  }
  return image;
}
