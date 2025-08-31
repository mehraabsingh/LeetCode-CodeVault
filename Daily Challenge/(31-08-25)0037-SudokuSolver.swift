class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        _ = backtrack(&board)
    }

    private func backtrack(_ board: inout [[Character]]) -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if board[row][col] == "." {
                    for char in "123456789" {
                        if isValid(board, row, col, char) {
                            board[row][col] = char
                            if backtrack(&board) { return true }
                            board[row][col] = "." // backtrack
                        }
                    }
                    return false
                }
            }
        }
        return true
    }

    private func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ char: Character) -> Bool {
        for i in 0..<9 {
            // check row
            if board[row][i] == char { return false }
            // check column
            if board[i][col] == char { return false }
            // check 3x3 sub-box
            let boxRow = 3 * (row / 3) + i / 3
            let boxCol = 3 * (col / 3) + i % 3
            if board[boxRow][boxCol] == char { return false }
        }
        return true
    }
}
