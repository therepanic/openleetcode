function subtractProductAndSum(n: number): number {
  let sum_digits = 0;
  let product_digits = 1;

  while (n > 0) {
    const digit = n % 10;
    sum_digits += digit;
    product_digits *= digit;
    n = Math.floor(n / 10);
  }

  return product_digits - sum_digits;
}
