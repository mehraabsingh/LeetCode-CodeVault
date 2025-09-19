class Spreadsheet {
    private var rows: Int
    private var cells: [String: Int]  // Dictionary to store cell values
    
    init(_ rows: Int) {
        self.rows = rows
        self.cells = [:]
    }
    
    func setCell(_ cell: String, _ value: Int) {
        cells[cell] = value
    }
    
    func resetCell(_ cell: String) {
        cells[cell] = 0
    }
    
    func getValue(_ formula: String) -> Int {
        // Formula looks like "=X+Y"
        let expression = String(formula.dropFirst())  // remove '='
        let parts = expression.split(separator: "+")
        
        guard parts.count == 2 else { return 0 }
        
        let left = String(parts[0])
        let right = String(parts[1])
        
        return evaluate(left) + evaluate(right)
    }
    
    private func evaluate(_ token: String) -> Int {
        // If it's a number
        if let num = Int(token) {
            return num
        }
        // Else it's a cell reference
        return cells[token] ?? 0
    }
}
