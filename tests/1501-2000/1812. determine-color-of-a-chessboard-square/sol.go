func squareIsWhite(coordinates string) bool {
    return (int(coordinates[0]) - int(coordinates[1]))%2 != 0
}
