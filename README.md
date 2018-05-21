# Cocoaheads turns X

This is a code golf challenge to celebrate the Xth birthday of the Cocoaheads Aachen Chapter 🎁🎉.

Clone the repository, implement `public func isHeatWaveIncludedIn(waves w: [Int]) -> Bool`, and create a pull request :).
There are tests included to validate your solution and there is a Run Script Phase which writes the byte count of your implemention to CharacterCount.txt.

The challenge:

The Royal Netherlands Meteorological Institute defines a heat wave* as a
series of at least 5 consecutive days of ≥25°C weather (“summery weather”),
such that at least 3 of those days are ≥30°C (“tropical weather”).
The tropical weather doesn't have to be measured consecutively: for example:
30, 25, 30, 26, 27, 28, 32, 30 is a 8-day long heat wave with 4 days of
tropical weather.

*(Well, by Dutch standards.)
Given a non-empty list of positive integers representing Celsius temperature
measurements from successive days, decide whether that list contains a heat
wave (as per the above definition).

The shortest answer in bytes wins.

The question was originally taken from: https://codegolf.stackexchange.com/questions/163188/detect-heat-waves
