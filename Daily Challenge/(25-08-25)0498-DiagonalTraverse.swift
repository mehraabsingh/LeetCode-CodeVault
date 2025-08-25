class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let m = mat.count
        let n = mat[0].count
        var result = [Int]()
        
        var row = 0, col = 0
        var direction = 1  // 1 = up-right, -1 = down-left
        
        while result.count < m * n {
            result.append(mat[row][col])
            
            // Move according to current direction
            let newRow = row + (direction == 1 ? -1 : 1)
            let newCol = col + (direction == 1 ? 1 : -1)
            
            // Check if still in bounds
            if newRow < 0 || newRow >= m || newCol < 0 || newCol >= n {
                // Handle boundary cases
                if direction == 1 {
                    if col + 1 < n {
                        col += 1
                    } else {
                        row += 1
                    }
                } else {
                    if row + 1 < m {
                        row += 1
                    } else {
                        col += 1
                    }
                }
                // Flip direction
                direction *= -1
            } else {
                row = newRow
                col = newCol
            }
        }
        
        return result
    }
}
