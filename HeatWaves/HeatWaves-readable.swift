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
    var a = 0, b = 0            // 'a' counts days ≥25°C, 'b' counts days ≥30°C, in the "current" series
    for i in w {                // iterate over the array of day temperatures
        if i > 24 {             //     if the day's temperature was ≥ 25 (*)
            a += 1              //         increment the number of days ≥25°C
            if i > 29 {         //         if the day's temperature was even ≥ 30 (*)
                b += 1          //             increment the number of days ≥30°C
            }                   //
            if a > 4 && b > 2 { //         if there are at least 5 days with ≥25°C and at least 3 ≥30°C in the current series (*)
                return 1>0      //             we found a heat wave, i.e. return true (**)
            }                   //
        } else {                //     if the day's temperature was < 25
            a = 0               //         this day cannot be in a heat wave and we reset the number of days ≥25°C / ≥30°C
            b = 0               //
        }                       //
    }                           //
    // we iterated over the full array but found no heat wave,
    return 1<0                // i.e. return false (***)
    
    // (*)   instead of "...  >= intConst" use "... > intConst-1" to save 1 byte (">=" vs ">")
    // (**)  "1>0" evalutes to true but needs one byte less than the Bool literal "true"
    // (***) "1<0" evalutes to false but needs two bytes less than the Bool literal "false"
}
