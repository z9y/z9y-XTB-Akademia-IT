
import Foundation

class FetchTurbineData {
    
    private let fileName = "turbines-data.csv"
    
    let filepath = Bundle.main.path(forResource: "turbines-data", ofType: "csv")
    

    /*
        Please implement this function.
        Function should read content of the turbines-data.csv file
        and fill data into HydroDatabase using HydroDatabaseInterface instance.
     
        Data in file are in CSV format.
     */

    func readTurbinesData() {
        var data = ""
        do {
            data = try String(contentsOfFile: filepath!)
        } catch {
            print(error)
            return
        }
        
        let rows = data.components(separatedBy: "\n")

                for row in rows {
                    let columns = row.components(separatedBy: ",")

                    if columns.count == 3 {
                        let name = columns[0]
                        let location = columns[1]
                        let efficiency = Double(columns[2]) ?? 0

                        let turbine = Turbine(name: name, location: location, efficiency: efficiency)

                        HydroDatabaseInterface.saveTurbinData(turbinData: turbine)
                    }
                }
    }
}
