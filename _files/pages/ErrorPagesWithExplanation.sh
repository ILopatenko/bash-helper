#!/bin/bash
# THIS FEATURE IS IN DEVELOPMENT PAGE

printWrongSelectionPage(){
   PageComponent \
      false \
      false \
      "UNFOURTINATELY $1" \
      false \
      "IS A WRONG SELECTION" \
      false \
      "PLEASE SELECT ANOTHER VARIANT!" \
      false \
      false \
      false \
      "*!PREVIOUS MENU WILL BE LOADED IN 2 SECONDS!*"
      
      sleep 1
}

printInDevelopmentPage(){
   PageComponent \
      false \
      false \
      "UNFOURTINATELY AT THE MOMENT" \
      false \
      "THIS FEATURE IS IN DEVELOPMENT" \
      false \
      "PLEASE SELECT ANOTHER VARIANT!" \
      false \
      false \
      false \
      "*!PREVIOUS MENU WILL BE LOADED IN 2 SECONDS!*"
      
      sleep 1
}