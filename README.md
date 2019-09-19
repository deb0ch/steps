
# Steps

Steps will help you script long install processes in a way that is as
controllable as if you were executing each individual command by hand.

For instance, when you follow a tutorial on how to setup a complex dev
environment you end up following multiple steps and writing a bunch of commands.
Now you can script that. Steps will log the commands ouput to a file giving each
one a step number, allowing you to resume to a specific step when an error
arise, even if it crashed your entire system.

Invoke `./steps` for further usage instructions.

## Existing scripts

For instance, to install Emacs from source on Ubuntu 18.04:

`./steps Ubuntu-a8.04/emacs.steps.sh`
