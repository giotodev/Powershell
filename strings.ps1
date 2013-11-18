$st = "This is a string"
$st.ToUpper()
$st.ToLower()
$c = $st.Contains('is')
"It is $c that the sentence contains 'is'."
$oc = [regex]::Matches($st,"i").Count
"The letter 'i' appears $oc times."
