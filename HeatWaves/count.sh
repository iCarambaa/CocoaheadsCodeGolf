#!/bin/bash

solution=$(<HeatWaves/HeatWaves.swift)

# extract function body between first { and last }
solution=${solution%\}*}
solution=${solution#*\{}

characters=${#solution}

echo "\n $characters characters"

heatWaves=$(<HeatWaves/HeatWaves.swift)
heatWaves=${heatWaves%\}*}

append="} // $characters bytes."
heatWaves+="$append"
echo "$heatWaves" > "./HeatWaves/HeatWaves.swift"
