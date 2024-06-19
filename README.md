# occ1950_to_occscore
What `occscore` corresponds with each `occ1950` in the census data?

How I answer this: 

1. download the 1910, 1920, 1930, 1940 full count census data for only the variables `occ1950` and `occscore` from [ipums](https://usa.ipums.org/usa-action/variables/group)
2. append those together and limit to distinct instances of the 2 variable values -- see `occ1950_to_occscores.R` for code for this

You're done! See `occ1950_to_occscores_(1910-40).csv` for the result.

## Small user notes
This is the mapping from `occ1950` to `occscore` using the underlying 1910, 1920, 1930, 1940 full count data. You may get a different mapping if you rely on different underlying samples because different `occ1950` values can vary over samples, and the mapping of `occ1950` to `occscore` can vary over time too (post-1950). Here is a direct quote from [ipums documentation](https://usa.ipums.org/usa/chapter4/chapter4.shtml#occscore): *"The occupational income score indicates the median total income -- in hundreds of dollars -- for persons in each occupation in 1950 with positive income. It is calculated using data from a published [1950 census report](https://www.census.gov/library/publications/1953/dec/population-vol-04.html) (See Table 19). For the post-1950 period, the score reflects the weighted average income of the 1950 occupational components of each contemporary occupation. In practice, this has only a small effect, but it means that the measure can vary slightly across census years for a given occupation."*
