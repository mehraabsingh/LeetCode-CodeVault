class Solution {
    func numSubmat(_ mat: [[Int]]) -> Int {
        let m = mat.count
        let n = mat[0].count
        var heights = Array(repeating: 0, count: n)
        var result = 0

        for i in 0..<m {
            // Update histogram heights
            for j in 0..<n {
                if mat[i][j] == 0 {
                    heights[j] = 0
                } else {
                    heights[j] += 1
                }
            }

            // Count rectangles ending at row i
            for j in 0..<n {
                var minHeight = heights[j]
                var k = j
                while k >= 0 && minHeight > 0 {
                    minHeight = min(minHeight, heights[k])
                    result += minHeight
                    k -= 1
                }
            }
        }
        return result
    }
}
