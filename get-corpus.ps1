function get-num {
    get-random -minimum 0 -maximum 9
    }
function gen-ssn {
    $dec = Get-Random -Minimum 0 -Maximum 4
    switch ($dec) {
        0 {$ssn = "$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)"}
        1 {$ssn = "$(get-num)$(get-num)$(get-num)-$(get-num)$(get-num)-$(get-num)$(get-num)$(get-num)$(get-num)"}
        2 {$ssn = "$(get-num)$(get-num)$(get-num)/$(get-num)$(get-num)/$(get-num)$(get-num)$(get-num)$(get-num)"}
        3 {$ssn = "$(get-num)$(get-num)$(get-num) $(get-num)$(get-num) $(get-num)$(get-num)$(get-num)$(get-num)"}
    }
    $ssn
    }
function gen-pn {
    $dec = Get-Random -Minimum 0 -Maximum 4
    switch ($dec) {
        0 {$pn = "1-$(get-num)$(get-num)$(get-num)-$(get-num)$(get-num)$(get-num)-$(get-num)$(get-num)$(get-num)$(get-num)"}
        1 {$pn = "1 ($(get-num)$(get-num)$(get-num)) $(get-num)$(get-num)$(get-num)-$(get-num)$(get-num)$(get-num)$(get-num)"}
        2 {$pn = "($(get-num)$(get-num)$(get-num)) $(get-num)$(get-num)$(get-num)-$(get-num)$(get-num)$(get-num)$(get-num)"}
        3 {$pn = "$(get-num)$(get-num)$(get-num)-$(get-num)$(get-num)$(get-num)-$(get-num)$(get-num)$(get-num)$(get-num)"}
    }
    $pn
    }
function gen-ccn {
    $dec = Get-Random -Minimum 0 -Maximum 2
    switch ($dec) {
        0 {$ccn = "$(get-num)$(get-num)$(get-num)$(get-num) $(get-num)$(get-num)$(get-num)$(get-num) $(get-num)$(get-num)$(get-num)$(get-num) $(get-num)$(get-num)$(get-num)$(get-num)"}
        1 {$ccn = "$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)$(get-num)"}
    }
    $ccn
    }

function get-corpus {
<#
.SYNOPSIS
This function quickly generates the desired number of Social Security Numbers, Credit Card Numbers, or Phone Numbers.

.PARAMETER Number
Enter the number of desired numbers

.PARAMETER Type
Enter "ssn" for social security numbers, "ccn" for credit card numbers, "pn" for phone numbers, or "all" for a random mix
#>

param (
    [string]$Type,
    [int]$Number
    )
    $ccnc = 0
    $ssnc = 0
    $pnc = 0
switch ($Type) {
    "ccn" { for ($i=0 ; $i -lt $Number ; $i++){ gen-ccn} }
    "ssn" { for ($i=0 ; $i -lt $Number ; $i++){ gen-ssn } }
    "pn" { for ($i=0 ; $i -lt $Number ; $i++){ gen-pn } } 
    "all" { for ($i=0 ; $i -lt $Number ; $i++){ $ran = get-random -minimum 0 -maximum 3
        switch ($ran) {
            0 {gen-ccn ; $ccnc++}
            1 {gen-ssn ; $ssnc++}
            2 {gen-pn ; $pnc++} } }
            write-host "CCN: $ccnc ; SSN: $ssnc ; PN: $pnc"
            }
            }
            }
