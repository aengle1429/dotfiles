`egrep` is grep with the -E flag

`sed -i` performed insertion on the file. On OSX you need to give it something like `sed -i'.original'`

Insert at beginning or end of file: `sed -i "1s/^/replacement/"` and `sed -i "$s/$/replacement/"`

#### Delete all occurrences of char:
`sed -i "s/pattern//g"`

### Other notes

* implicit .* at beginning of grep 'rexp'
* use single quote to suppress shell substitutions
* add .* to replace whole line with the pattern in sed. This is the last names example from class

## Notes on regex for myself later
* Need to include the dash '-' in the matching for website sacred-texts.com
* the dash operator needs to be escaped unless we put it at the beginning or end [0-9-] [-a-z]
* first grouping [] does NOT have a backslash
* second grouping [] has a backslash and needs to be escaped else it's a delimiter to sed!
* the first grouping matches anything in that bracket 2 - 200 times, "amazon" will be matched, so will "twit.co" or "warez-bb", basically everything but the final .com or .uk or .gov
* then we match a literal ., followed by 2 to 4 letters consecutively, followed by any of the valid URL characters (note that " is not a valid url character?) and match these 0 or more times optionally
stop the group, then match whatever and forget it in the substitution.
dot operator does not need to be escaped in the range []

## Rules
### A regular expression p matches a string s...
* If p is
    * a, b match the single character
    * p1p2 matches s if we can write s as s1s2 where p1 matches s1 and * p2 matches s2
    * p1|p2,... if p1 matches s or p2 matches s
    * p* if there is an i>=0 s.t. p...p (i times) matches s. For i = 0, matches the empty string.
n
ote that [a]{4} matches literally the same thing four times. It's pppp. 

need to match the whole line, if we just do a regex like [^aeiou]+, then any line containing vowels is matched as long as there are non-vowels in there.

`bat\|cat` matches bat or cat, but `ba\(t\|c)at` matches batat or bacat  ... the or is greedy

? is not standard regexp it is extended. short for e | p
+ is also not standard regexp. Short for pp*

