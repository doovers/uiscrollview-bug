# uiscrollview-bug
Demonstration of strange uiscrollview behaviour

# Steps to reproduce (iPhone 6/6s)

1. Comment out fix in the ViewController adjustForKeyboard method (line 69)
2. Select 'First Name' text field by tapping on it making sure that it is in focus
3. Scroll view down until 'Device' field is visible and tap on it again making sure that it is in focus
4. Dismiss the keyboard by pressing the done button
5. Note that signup button does not fire action

# Note

The hack included solves the problem but results in an ugly jump as the scroll view updates it's content offset
