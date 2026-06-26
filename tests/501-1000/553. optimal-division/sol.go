import (
	"strconv"
)

func optimalDivision(nums []int) string {
    result := strconv.Itoa(nums[0])
    
    if len(nums) == 1 {
        return result
    }
    
    if len(nums) == 2 {
        return result + "/" + strconv.Itoa(nums[1])
    }
    
    result += "/(" + strconv.Itoa(nums[1])
    for i := 2; i < len(nums); i++ {
        result += "/" + strconv.Itoa(nums[i])
    }
    
    return result + ")"
}
