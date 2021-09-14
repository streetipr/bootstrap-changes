#!/usr/bin/env bash
clear ; cowsay "Okay, Editor tutorial! Hit Enter / Return to continue"
read user_response
clear ; cowsay "I will type and interact with the terminal the same way you can"
read user_response
clear ; cowsay "Don't touch the screen until the tutorial has finished!"
read user_response
clear ; cowsay "First I will split the window, so I can continue to explain.."
read user_response
tmux split-pane -dv 
clear ; cowsay "Now I will type the edit command..."
read user_response
tel-typewriter -i tel-edit -t Tutorial.bottom
clear ; cowsay "Now I will hit Enter to run the file picker interatively"
read user_response
tel-typewriter -k Enter -t Tutorial.bottom
clear ; cowsay "Then I start typing a file name, it's closest result is highlighted"
read user_response
tel-typewriter -i configs -t Tutorial.bottom
clear ; cowsay "As soon as the file you wish to edit for has been highlighted.."
read user_response
clear ; cowsay "You can hit enter again to open the file in your editor! or cancel the command with Ctrl+c or ESC"
read user_response
clear ; cowsay "I will cancel with Ctrl+c for now"
read user_response
tel-typewriter -k C-c -t Tutorial.bottom
clear ; cowsay "you can also start tel-edit in a new split with the shortcut: TEL+e"
read user_response
tel-typewriter -k M-e -t Tutorial.bottom
clear ; cowsay "Thus concludes the tutorial!"
read user_response
tel-typewriter -i exit -k Enter -t Tutorial.bottom
