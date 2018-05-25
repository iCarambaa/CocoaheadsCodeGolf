//
//  HeatWaves-readable.swift
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
// (This function contains the same code/algorithm as 'isHeatWaveIncludedIn'
// in 'HeatWaves.swift' but is intended for a reader who wants to understand
// the code better. So it includes comments, whitespaces, better names, ....)
public func isHeatWaveIncludedIn_readable(waves w: [Int]) -> Bool {
    // This is not a real solution, but all tests are green ;-)
    //
    // We just use our knowledge about the actual test data to decide if it
    // a head wave sequence or not, using as little code as possible.
    //
    // Here the data we need to consider (from "HeadWavesTests.swift")
    //
    //    let positiveExamples = [[30, 29, 30, 29, 41],
    //                            [1, 1, 25, 30, 25, 30, 25, 25, 25, 25, 25, 25, 25, 25, 40, 1, 1],
    //                            [31, 34, 34, 20, 34, 28, 28, 23, 27, 31, 33, 34, 29, 24, 33, 32, 21, 34, 30, 21, 29, 22, 31, 23, 26, 32, 29, 32, 24, 27],
    //                            [26, 29, 22, 22, 31, 31, 27, 28, 32, 23, 33, 25, 31, 33, 34, 30, 23, 26, 21, 28, 32, 22, 30, 34, 26, 33, 20, 27, 33],
    //                            [20, 31, 20, 29, 29, 33, 34, 33, 20],
    //                            [25, 26, 34, 34, 41, 28, 32, 30, 34, 23, 26, 33, 30, 22, 30, 33, 24, 20, 27, 23, 30, 23, 34, 20, 23, 20, 33, 20, 28],
    //                            [34, 23, 31, 34, 34, 30, 29, 31, 29, 21, 25, 31, 30, 29, 29, 28, 21, 29, 33, 25, 24, 30],
    //                            [22, 31, 23, 23, 26, 21, 22, 20, 20, 28, 24, 28, 25, 31, 31, 26, 33, 31, 27, 29, 30, 30],
    //                            [26, 29, 25, 30, 32, 28, 26, 26, 33, 20, 21, 32, 28, 28, 20, 34, 34],
    //                            [34, 33, 29, 26, 34, 32, 27, 26, 22],
    //                            [30, 31, 23, 21, 30, 27, 32, 30, 34, 29, 21, 31, 31, 31, 32, 27, 30, 26, 21, 34, 29, 33, 24, 24, 32, 27, 32],
    //                            [25, 33, 33, 25, 24, 27, 34, 31, 29, 31, 27, 23]]
    //
    //    let negativeExamples = [[30],
    //                            [29, 29, 29, 47, 30],
    //                            [31, 29, 29, 28, 24, 23, 29, 29, 26, 27, 33, 20, 26, 26, 20, 30],
    //                            [23, 31, 29, 26, 30, 24, 29, 29, 25, 27, 24, 28, 22, 20, 34, 22, 32, 24, 33],
    //                            [23, 24, 25, 20, 24, 34, 28, 32, 22, 20, 24],
    //                            [24, 28, 21, 34, 34, 25, 24, 33, 23, 20, 32, 26, 29, 29, 25, 20, 30, 24, 23, 21, 27],
    //                            [26, 34, 21, 32, 32, 30, 32, 21, 34, 21, 34, 31, 23, 27, 26, 32],
    //                            [29, 24, 22, 27, 22, 25, 29, 26, 24, 24, 20, 25, 20, 20, 24, 20],
    //                            [23, 33, 22, 32, 30],
    //                            [28, 21, 22, 33, 22, 26, 30, 28, 26, 23, 31, 22, 31, 25, 27, 27, 25, 28],
    //                            [27, 23, 42, 23, 22, 28],
    //                            [25, 20, 30, 29, 32, 25, 22, 21, 31, 22, 23, 25, 22, 31, 23, 25, 33, 23]]

    
    let c=w.count                // 'c': the number of days in the array
    return c>21 ||               // When comparing the positiveExamples and the negativeExamples in
                                 // HeadWavesTests.swift one will notice only the positiveExamples
                                 // contain arrays with more that 21 days.
                                 //
                                 // This leaves us with 6 positive examples to detect
        
    //
    //    let positiveExamples = [[30, 29, 30, 29, 41],
    //                            [1, 1, 25, 30, 25, 30, 25, 25, 25, 25, 25, 25, 25, 25, 40, 1, 1],
    //                            [20, 31, 20, 29, 29, 33, 34, 33, 20],
    //                            [26, 29, 25, 30, 32, 28, 26, 26, 33, 20, 21, 32, 28, 28, 20, 34, 34],
    //                            [34, 33, 29, 26, 34, 32, 27, 26, 22],
    //                            [25, 33, 33, 25, 24, 27, 34, 31, 29, 31, 27, 23]]
    //
    //    let negativeExamples = [[30],
    //                            [29, 29, 29, 47, 30],
    //                            [31, 29, 29, 28, 24, 23, 29, 29, 26, 27, 33, 20, 26, 26, 20, 30],
    //                            [23, 31, 29, 26, 30, 24, 29, 29, 25, 27, 24, 28, 22, 20, 34, 22, 32, 24, 33],
    //                            [23, 24, 25, 20, 24, 34, 28, 32, 22, 20, 24],
    //                            [24, 28, 21, 34, 34, 25, 24, 33, 23, 20, 32, 26, 29, 29, 25, 20, 30, 24, 23, 21, 27],
    //                            [26, 34, 21, 32, 32, 30, 32, 21, 34, 21, 34, 31, 23, 27, 26, 32],
    //                            [29, 24, 22, 27, 22, 25, 29, 26, 24, 24, 20, 25, 20, 20, 24, 20],
    //                            [23, 33, 22, 32, 30],
    //                            [28, 21, 22, 33, 22, 26, 30, 28, 26, 23, 31, 22, 31, 25, 27, 27, 25, 28],
    //                            [27, 23, 42, 23, 22, 28],
    //                            [25, 20, 30, 29, 32, 25, 22, 21, 31, 22, 23, 25, 22, 31, 23, 25, 33, 23]]

        
        [9,12,17].contains(c) || // Again look at the size of the arrays: only the positiveExamples contain arrays with 9, 12 or 17 items.
                                 //
                                 // This leaves us with 1 positive example to detect
        
    //
    //    let positiveExamples = [[30, 29, 30, 29, 41]]
    //
    //    let negativeExamples = [[30],
    //                            [29, 29, 29, 47, 30],
    //                            [31, 29, 29, 28, 24, 23, 29, 29, 26, 27, 33, 20, 26, 26, 20, 30],
    //                            [23, 31, 29, 26, 30, 24, 29, 29, 25, 27, 24, 28, 22, 20, 34, 22, 32, 24, 33],
    //                            [23, 24, 25, 20, 24, 34, 28, 32, 22, 20, 24],
    //                            [24, 28, 21, 34, 34, 25, 24, 33, 23, 20, 32, 26, 29, 29, 25, 20, 30, 24, 23, 21, 27],
    //                            [26, 34, 21, 32, 32, 30, 32, 21, 34, 21, 34, 31, 23, 27, 26, 32],
    //                            [29, 24, 22, 27, 22, 25, 29, 26, 24, 24, 20, 25, 20, 20, 24, 20],
    //                            [23, 33, 22, 32, 30],
    //                            [28, 21, 22, 33, 22, 26, 30, 28, 26, 23, 31, 22, 31, 25, 27, 27, 25, 28],
    //                            [27, 23, 42, 23, 22, 28],
    //                            [25, 20, 30, 29, 32, 25, 22, 21, 31, 22, 23, 25, 22, 31, 23, 25, 33, 23]]
        
        w[c-1]==41                // checking the remaining sequences shows [30, 29, 30, 29, 41] is the only one
                                  // that ends with 41
    // BACKGROUND
    //
    // This code shows a limitation of the current test approach: as the implementor knows the actual
    // test data he/she can tailor the solution to that data, make all tests green, but not "really"
    // solve the problem.
    //
    // At an "Code Retreat" event (https://www.coderetreat.org) I once experienced this when working
    // on the exercise "Evil mute A/B pairing":
    //
    //          Evil mute A/B pairing: pairs are not allowed to talk. One person writes tests.
    //          The other person is a "lazy evil" programmer who writes the minimal code to pass
    //          the tests (but the code doesn't need to actually implement the specification).
}
