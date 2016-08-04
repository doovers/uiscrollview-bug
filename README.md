# uiscrollview-bug
Demonstration of strange uiscrollview behaviour

# Steps to reproduce

1. Remove hack included in the ViewController adjustForKeyboard method
1. Manually select each field one at a time from top to bottom (no need to enter text)
2. In the last field press done button
3. Note that signup button does not fire action

# Note

The hack included solves the problem but results in an ugly jump as the scroll view updates it's content offset
