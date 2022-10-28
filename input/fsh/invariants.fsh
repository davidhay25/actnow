//common invariants - used across profiles

Invariant: an-period-1
Expression: "Period.end >= Period.start"
Severity: #error
Description: "The end date of a period must be greater than or equal to the start date"