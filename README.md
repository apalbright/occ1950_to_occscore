# occ1950_to_occscore
What occscore does each occ1950 map to in the census data?

How I answer this: 

1. download the 1910, 1920, 1930, 1940 full count census data for only the variables `occ1950` and `occscore` from [ipums](https://usa.ipums.org/usa-action/variables/group)
2. append those together and limit to distinct instances of the 2 variable values -- see `occ1950_to_occscores.R` for code for this

You're done! See `occ1950_to_occscores_(1910-40).csv` for the result.
