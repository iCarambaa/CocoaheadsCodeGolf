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

    // This solution is similar to "solution-99-OldSchool" but it only needs
    // one variable 'a' to count the days ≥25°C (but <30°C) resp. days ≥30°C.
    //
    // To achieve this the variable 'a' holds the count as factors of prim numbers. I.e.
    // (!!!) to represent n days ≥25°C (but <30°C) and m days ≥30°C we use the formula 2^n*3^m
    
    var a = 1                   // Reset the counter. As we use multiplication this is 1, not 0
    for i in w {                // iterate over the array of day temperatures
        if i > 24 {             //     if the day's temperature was ≥ 25 (*)
            a *= i > 29 ?       //         if the day's temperature was even ≥ 30 (*)
                3     //             increment the number of days ≥30°C // see (!!!)
                :       //         otherwise
            2     //             increment the number of days ≥25°C (but <30°C) // see (!!!)
            //
            if a % 27 == 0 &&   //         When we have at least 3 days ≥30°C (**)
                a > 81 {  //         and 2 more days ≥25°C (***)
                return 1 > 0    //             we have a heat wave and return true (****)
            }                   //
        } else {                //     if the day's temperature was < 25
            a = 1               //         this day cannot be in a heat wave and we reset the number of days ≥25°C / ≥30°C
        }                       //
    }                           //
    // we iterated over the full array but found no heat wave,
    return 1<0                  // i.e. return false (*****)
    
    // (*)     instead of "...  >= intConst" use "... > intConst-1" to save 1 byte (">=" vs ">")
    //
    // (**)    3 days ≥30°C means 'a' contains at least the factors 3*3*3 == 27. To check this we
    //         just need to divide 'a' by 27 and check if the remainder is 0 ("modulo").
    //
    // (***)   We already know we have at least 3 days ≥30°C, i.e. 'a' contains 3*3*3 (see **).
    //         Now lets check some cases:
    //
    //         | # ≥25°C but <30°C | # ≥30°C |   a | isHeadWave? |
    //         |-------------------+---------+-----+-------------|
    //         | 0                 | 3       |  27 | false       |
    //         | 1                 | 3       |  54 | false       |
    //         | 2                 | 3       | 108 | true        |
    //         | 0                 | 4       |  81 | false       |
    //         | 1                 | 4       | 162 | true        |
    //
    //         As we can see, when a > 81 (and there are at least 3 days ≥30°C) we have heat wave.
    //
    // (****)  "1>0" evalutes to true but needs one byte less than the Bool literal "true"
    //
    // (*****) "1<0" evalutes to false but needs two bytes less than the Bool literal "false"

}
