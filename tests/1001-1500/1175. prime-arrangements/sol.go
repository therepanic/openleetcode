const MOD = 1000000007

var isPrime [101]bool
var prefixPrime [101]int

func init() {
	for i := 2; i <= 100; i++ {
		isPrime[i] = true
	}
	for i := 2; i*i <= 100; i++ {
		if isPrime[i] {
			for j := i * i; j <= 100; j += i {
				isPrime[j] = false
			}
		}
	}
	for i := 2; i <= 100; i++ {
		prefixPrime[i] = prefixPrime[i-1]
		if isPrime[i] {
			prefixPrime[i]++
		}
	}
}

func numPrimeArrangements(n int) int {
	x := prefixPrime[n]
	y := n - x
	proX := 1
	proY := 1

	for i := 2; i <= x; i++ {
		proX = (proX * i) % MOD
	}
	for i := 2; i <= y; i++ {
		proY = (proY * i) % MOD
	}

	return (proX * proY) % MOD
}
