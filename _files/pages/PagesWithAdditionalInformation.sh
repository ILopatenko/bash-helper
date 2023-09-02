#!/bin/bash
# THIS FEATURE IS IN DEVELOPMENT PAGE

printGreetingPage(){

   PageComponent \
      false \
      false \
      "HELLO! THIS IS MY BASH HELPER" \
      false \
      "IT CAN HELP YOU TO PERFORM SOME BORING STUFF" \
      false \
      "RESERVED FOR ADDITIONSL INFORMATION" \
      false \
      false \
      false \
      "*!MAIN MENU WILL BE LOADED IN 1 SECOND!*"
}

printPreExitPage(){

   PageComponent \
      false \
      false \
      "THANKS FOR USING MY BASH HELPER!" \
      false \
      "I HOPE IT HAS HELPED YOU" \
      false \
      "RESERVED FOR ADDITIONSL INFORMATION" \
      false \
      false \
      false \
      "*!APP WILL BE CLOSED IN 1 SECOND!*"
      clear -x
      exit
}