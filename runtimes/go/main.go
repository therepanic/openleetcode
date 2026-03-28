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
	fmt.Print(toJson(${CALL_SOLUTION}))
}
