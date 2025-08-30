class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // Track rows, cols, and 3x3 boxes
        var rows = Array(repeating: Set<Character>(), count: 9)
        var cols = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)
        
        for r in 0..<9 {
            for c in 0..<9 {
                let val = board[r][c]
                if val == "." { continue }
                
                // Check row
                if rows[r].contains(val) {
                    return false
                }
                rows[r].insert(val)
                
                // Check column
                if cols[c].contains(val) {
                    return false
                }
                cols[c].insert(val)
                
                // Check 3x3 box
                let boxIndex = (r / 3) * 3 + (c / 3)
                if boxes[boxIndex].contains(val) {
                    return false
                }
                boxes[boxIndex].insert(val)
            }
        }
        return true
    }
}
