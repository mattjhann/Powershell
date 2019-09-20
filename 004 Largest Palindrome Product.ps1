<#
A palindrome is a string which reads the same forward as it does backward
this means the middle character can be ignored hence the -lt rather than
an -le comparison on the length.

The outermost loop need only check the top half of the numbers supplied (rounded down)
hence the Floor calculation at the start (2 * 4 is the same as 4 * 2) it then works down
through the numbers from 999 to find the highestPalindrome. Once it has found one it is
stored in a variable and the calculation only gets done if the product is higher than
the highestPalindrome, otherwise it is ignored. This speeds up processing.

From testing with Measure-Command the optimisations make these improvements
No lower bound in outer loop or highestPalindrome test      : 42.1 seconds
No highestPalindrome test                                   : 21.5 seconds
No lower bound in outer loop                                : 3.29 seconds
Full optimisation                                           : 1.68 seconds
#>

function Is-Palindrome {
    param (
        $number
    )
    $output = $true
    for ($i = 0; $i -lt $number.length/2; $i++) {
        $number = $number.ToString()
        if($number[$i] -ne $number[-($i+1)]) {
            $output = $false
        }
    }
    return $output
}

$lowerBound = [System.Math]::Floor((999 + 100) / 2)
for ($j = 999; $j -ge $lowerBound; $j--) {
    for ($k = 999; $k -ge 100; $k--) {
        $product = $j * $k
        if ($product -gt $highestPalindrome) {
            if (Is-Palindrome($product)) {
                $highestPalindrome = $product
                $highestString = "$j * $k = $product"
            }
        }
    }
}

$highestString