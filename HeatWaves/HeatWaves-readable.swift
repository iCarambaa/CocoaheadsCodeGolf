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
    
    // This solution uses a single array reduce to determine if the array contains
    // a heat wave. When the reduce returns 0 we have a heat wave.
    //
    // The reduced value encodes the number of days ≥25°C (but <30°C) and days ≥30°C found
    // so far in the current series.
    //
    // To encode these two counters in one number we use factors of prim numbers.
    //
    // (!!!1) When we found a heat wave the reduced value becomes 0.
    //
    // (!!!2) To represent n days ≥25°C (but <30°C) and m days ≥30°C we use the formula "2^n*3^m"
    //
    //         E.g. 2*3*3*3 = 108 means: 1 day ≥25°C (but <30°C) and 3 days ≥30°C
    //
    // (!!!3) 2^0*3^0 = 1 means: no days ≥25°C (or ≥30°C)
    //
    
    return w.reduce(
        1,                          // initialize the reduce with no days (see !!!3)
        {                           //
            let n = $1 > 24 ?       // when the day's temperature was ≥ 25 (*)
                $0 * (              //     we "increment" the counter by multiplying with the proper factor:
                    $1>29 ?         //         when the day's temperature was ≥ 30 (*)
                        3           //             we multiply with 3 (see !!!2)
                        :           //         when the day's temperature was < 30 (but ≥ 25)
                    2)              //             we multiply with 2 (see !!!2)
                :                   // when the day's temperature was < 25
                $0>0 ?              //     and we have not yet found a heat wave (see !!!1)
                    1               //         we clear the counter to no days (see !!!3)
                :                   //     when we have found a heat wave before (see !!!1)
            0                       //         we keep this information, i.e. use 0.
                                    //
                                    // Now let's check if we found a heat wave:
            return n % 27 == 0 &&   // When we have at least 3 days ≥30°C (**)
                n > 81 ?            //              and 2 more days ≥25°C (***)
                    0               //      we have a heat wave and return 0 (see !!!1)
                :                   // Otherwise
            n}                      //      we return the count (that may also be 0)
                                    //
        )<1                         // Finally we just need to check if the result of the reduce is 0
                                    // to determine if we found a heat wave (****)
  
    
    
    // (*)     instead of "...  >= intConst" use "... > intConst-1" to save 1 byte (">=" vs ">")
    //
    // (**)    3 days ≥30°C means 'n' contains at least the factors 3*3*3 == 27. To check this we
    //         just need to divide 'n' by 27 and check if the remainder is 0 ("modulo").
    //
    // (***)   We already know we have at least 3 days ≥30°C, i.e. 'a' contains 3*3*3 (see **).
    //         Now lets check some cases:
    //
    //         | # ≥25°C but <30°C | # ≥30°C |   n | isHeatWave? |
    //         |-------------------+---------+-----+-------------|
    //         | 0                 | 3       |  27 | false       |
    //         | 1                 | 3       |  54 | false       |
    //         | 2                 | 3       | 108 | true        |
    //         | 0                 | 4       |  81 | false       |
    //         | 1                 | 4       | 162 | true        |
    //
    //         As we can see, when n > 81 (and there are at least 3 days ≥30°C) we have a heat wave.
    //
    // (****)  instead of "== 0"" use "< 0" to save 1 byte ("==" vs "<").
    //         This transformation is correct as the reduce will only return positive Ints and 0.
    
}
