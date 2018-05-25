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
    
    // This solution is similar to "solution-087-Reduce-Factors" but makes use of an
    // extra nested closure. It looks like this is "too much" for the current
    // Swift compiler (4.1) as it reports the error:
    //
    //     Expression was too complex to be solved in reasonable time; consider breaking up the expression into distinct sub-expressions
    //
    // Too bad, as this is an 80 bytes solution !
    //
    // BTW: as suggested in the error message breaking up the expression solves the issue.
    // E.g. if we extract the nested closure into an outer variable 'f':
    //
    //      let f={$0%27==0&&$0>81 ?0:$0};return w.reduce(1,{f($1>24 ?$0*($1>29 ?3:2):$0>0 ?1:0)})<1
    //
    // the code compiles and the tests are green. However we are now at 88 bytes!
    //
    
    // Expect a compile error in the next line. See comment above...
    return w.reduce(1,{($1>24 ?$0*($1>29 ?3:2):$0>0 ?1:0){$0%27==0&&$0>81 ?0:$0}})<1

    // This solution is not yet fully documented. but you may have a look at "solution-087-Reduce-Factors"
    // to get an idea how it works. The following lines align both solutions and show the differences:
    //
    // "solution-080-TooComplex"        return w.reduce(1,{(     $1>24 ?$0*($1>29 ?3:2):$0>0 ?1:0){      $0%27==0&&$0>81 ?0:$0}})<1
    // "solution-087-Reduce-Factors"    return w.reduce(1,{let n=$1>24 ?$0*($1>29 ?3:2):$0>0 ?1:0;return n %27==0&&n >81 ?0:n })<1

}
