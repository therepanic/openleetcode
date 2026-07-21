function filterRestaurants(
  restaurants: number[][],
  veganFriendly: number,
  maxPrice: number,
  maxDistance: number,
): number[] {
  const restaurantsFiltered: number[][] = [];

  for (const restaurant of restaurants) {
    if (veganFriendly === 1 && restaurant[2] !== 1) {
      continue;
    }

    if (restaurant[3] > maxPrice) {
      continue;
    }

    if (restaurant[4] > maxDistance) {
      continue;
    }

    restaurantsFiltered.push([restaurant[1], restaurant[0]]);
  }

  restaurantsFiltered.sort((a, b) => {
    if (b[0] !== a[0]) {
      return b[0] - a[0];
    }
    return b[1] - a[1];
  });

  const result: number[] = [];

  for (const restaurant of restaurantsFiltered) {
    result.push(restaurant[1]);
  }

  return result;
}
