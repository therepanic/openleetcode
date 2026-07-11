function distributeCandies(candies: number, num_people: number): number[] {
  const res: number[] = new Array(num_people).fill(0);
  let give = 1;
  let i = 0;

  while (candies > 0) {
    res[i % num_people] += Math.min(give, candies);
    candies -= give;
    give++;
    i++;
  }

  return res;
}
