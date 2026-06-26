import (
	"math"
)

func fib(n int) int {
    sqrt5 := math.Sqrt(5)
    fibN := math.Pow((1+sqrt5)/2, float64(n)) - math.Pow((1-sqrt5)/2, float64(n))
    return int(math.Round(fibN / sqrt5))
}
