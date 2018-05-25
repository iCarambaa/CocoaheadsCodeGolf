//
//  HeatWaves.swift
//  HeatWaves
//
//  Solution by Udo Borkowski (2018-05-25)
//
//  FOR THE PUBLIC DOMAIN
//

// Background
//
// The Royal Netherlands Meteorological Institute defines a heat wave* as a
// series of at least 5 consecutive days of ≥25°C weather (“summery weather”),
// such that at least 3 of those days are ≥30°C (“tropical weather”).
//
// The tropical weather doesn't have to be measured consecutively: for example:
// 30, 25, 30, 26, 27, 28, 32, 30 is a 8-day long heat wave with 4 days of
// tropical weather.
//
// *(Well, by Dutch standards.)
//
// Challenge
//
// Given a non-empty list of positive integers representing Celsius temperature
// measurements from successive days, decide whether that list contains a heat
// wave (as per the above definition).
//
// The shortest answer in bytes wins.
//
// (see "HeatWaves-readable.swift" for a readable/commented version of this code)
//
// NOTICE: The following code gives a compile error when running in Xcode 4.1 (Swift 4.1):
//
//      "Expression was too complex to be solved in reasonable time; consider breaking up the expression into distinct sub-expressions"
//
// This is most likely caused by Swift's algorithm that resolves overloaded functions. In case this algorithm
// is improved in a later Swift version this code may compile and run....
public func isHeatWaveIncludedIn(waves w: [Int]) -> Bool {
    return w.reduce(1,{($1>24 ?$0*($1>29 ?3:2):$0>0 ?1:0){$0%27==0&&$0>81 ?0:$0}})<1
}
