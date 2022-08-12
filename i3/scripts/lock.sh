#!/bin/sh
# Script for locking with i3lock-color

BLANK='#00000000'
CLEAR='#32344a22'
DEFAULT='#449dab'
TEXT='#a9b1d6ff'
INPUT='#7aa2f7ff'
WRONG='#f7768ebb'
VERIFYING='#9ece6abb'
BACKGROUND='#24283bFF'

i3lock \
--color=$BACKGROUND \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--radius=300.0 \
--ring-width=50.0 \
--centered \
--screen 1                   \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \
--keylayout 1                \
