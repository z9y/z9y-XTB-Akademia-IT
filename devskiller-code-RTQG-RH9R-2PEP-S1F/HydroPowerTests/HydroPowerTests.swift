
import XCTest
@testable import HydroPower

class HydroPowerTests: XCTestCase {

    override func tearDown() {
        HydroDatabaseInterface.clear()
    }
    
    func testReadTurbineDataRecordsCount() {
        let fetch = FetchTurbineData()
        fetch.readTurbinesData()
        
        let recordsCount = HydroDatabaseInterface.turbinesCount()
        
        XCTAssertEqual(recordsCount, 12)
    }
    
    func testReadTurbineDataFirstTurbin() {
        let fetch = FetchTurbineData()
        fetch.readTurbinesData()
        
        let turbines = HydroDatabaseInterface.getTurbines()
        let firstTurbine = turbines.first
        
        XCTAssertEqual(firstTurbine?.name, "turbine02")
    }

    func testReadTurbineDataLastTurbin() {
        let fetch = FetchTurbineData()
        fetch.readTurbinesData()
        
        let turbines = HydroDatabaseInterface.getTurbines()
        let lastTurbine = turbines.last
        
        XCTAssertEqual(lastTurbine?.name, "turbine87")
    }
    
    func testLowEfficiencyTurbinesResultCount() {
        let fetch = FetchTurbineData()
        fetch.readTurbinesData()
        
        let turbines = HydroDatabaseInterface.getTurbines()
        let efficiencyLogic = TurbineEfficiencyLogic()
        
        let lowEfficientTurbines = efficiencyLogic.findLowEfficienctTurbins(efficiencyTreshold: 300, turbines: turbines)
        XCTAssertEqual(lowEfficientTurbines.count, 6)
    }
    
    func testLowEfficiencyTurbinesResultNames() {
        let fetch = FetchTurbineData()
        fetch.readTurbinesData()
        
        let turbines = HydroDatabaseInterface.getTurbines()
        let efficiencyLogic = TurbineEfficiencyLogic()
        
        let lowEfficientTurbines = efficiencyLogic.findLowEfficienctTurbins(efficiencyTreshold: 300, turbines: turbines)
        XCTAssertTrue(lowEfficientTurbines.contains { $0.name == "turbine03"})
        XCTAssertTrue(lowEfficientTurbines.contains { $0.name == "turbine09"})
        XCTAssertTrue(lowEfficientTurbines.contains { $0.name == "turbine11"})
        XCTAssertTrue(lowEfficientTurbines.contains { $0.name == "turbine43"})
        XCTAssertTrue(lowEfficientTurbines.contains { $0.name == "turbine08"})
        XCTAssertTrue(lowEfficientTurbines.contains { $0.name == "turbine04"})
    }
    
    func testConvertTurbineEfficiencyValue() {
        let fetch = FetchTurbineData()
        fetch.readTurbinesData()
        
        let turbine = HydroDatabaseInterface.getTurbin(index: 2)
        let efficiencyLogic = TurbineEfficiencyLogic()
        
        let turbineHourEfficient = efficiencyLogic.convertTurbineEfficiency(turbineData: turbine)
        XCTAssertEqual(turbineHourEfficient, "8.93 / h")
    }
    
    func testCategorizeTurbineLowEfficiencyTest() {
        let fetch = FetchTurbineData()
        fetch.readTurbinesData()
        
        let turbine = HydroDatabaseInterface.getTurbin(index: 0)
        let efficiencyLogic = TurbineEfficiencyLogic()
        let lowEfficiencyColor = efficiencyLogic.categorizeTurbine(turbineData: turbine)
        XCTAssertEqual(lowEfficiencyColor, EfficiencyColor.Green)
    }
    
    func testCategorizeTurbineHighEfficiencyTest() {
        let fetch = FetchTurbineData()
        fetch.readTurbinesData()
        
        let turbine = HydroDatabaseInterface.getTurbin(index: 3)
        let efficiencyLogic = TurbineEfficiencyLogic()
        let highEfficiencyColor = efficiencyLogic.categorizeTurbine(turbineData: turbine)
        XCTAssertEqual(highEfficiencyColor, EfficiencyColor.Red)
    }
}
