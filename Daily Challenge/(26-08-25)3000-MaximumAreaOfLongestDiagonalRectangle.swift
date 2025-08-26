class Solution {
    func areaOfMaxDiagonal(_ dimensions: [[Int]]) -> Int {
        var maxDiagonal = 0
        var maxArea = 0
        
        for rect in dimensions {
            let l = rect[0]
            let w = rect[1]
            let diagonalSq = l * l + w * w
            let area = l * w
            
            if diagonalSq > maxDiagonal {
                maxDiagonal = diagonalSq
                maxArea = area
            } else if diagonalSq == maxDiagonal {
                maxArea = max(maxArea, area)
            }
        }
        
        return maxArea
    }
}
