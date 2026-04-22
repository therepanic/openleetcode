package main

import (
    "fmt"
    "reflect"
    "strings"
    "time"
    "unsafe"
)

${SOLUTION}

${UTILITIES}

func main() {
    cur := time.Now().UnixMilli()
    ${CALL_SOLUTION}
    now := time.Now().UnixMilli()
    fmt.Print(now - cur)
}
