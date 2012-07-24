Pygame Examples
===============

The pygame distribution includes a number of example programs. In the Raspberry Pi the examples are stored here:

  /usr/lib/python2.7/dist-packages/pygame/examples

The website which documents the examples and describes how to run them is here:

   http://www.pygame.org/docs/ref/examples.html

This launcher allows a subset of the examples to be run and the website to be accessed.

Entries marked with ** will run from the launcher but are better run from a terminal as they print some additional text. These can be run by opening a terminal on the desktop from any directory and typing:

     python -m pygame.examples.game

where game is the name in the lefthand coloumn of the menu.

Other examples in the directory are not included because they must be run from a terminal or having missing dependencies.

The long delay when closing each example is due to a bug in one of the libraries on which pygame relies.
