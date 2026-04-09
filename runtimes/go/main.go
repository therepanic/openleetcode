package main

import (
	"fmt"
	"reflect"
	"strings"
	"time"
	"unsafe"
)

${SOLUTION}

${JSON_GEN}

func main() {
	fmt.Println(toJson(${CALL_SOLUTION}))
}
