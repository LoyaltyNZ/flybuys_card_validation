# Checking Fly Buys Cards

## Introduction

Develop a Ruby application that solves the problem described below. The aim of the problem is to allow the candidate to *demonstrate their skill and experience* in aspects of the development process including domain modelling, object orientated design, use of language construct and idioms, and testing (unit or otherwise).

There is provided sample data to be used for testing and the candidate should be able to demonstrate their solution using the supplied data in the form of a command line interface and/or unit test.

You will be required to talk through your solution at the interview.

## Problem

We want to identify different Fly Buys cards by running some sanity checks on the card number.

A common check that is performed upfront is to validate the card type based on the starting digits and length of card number. The main patterns that we care about are as follows:

    +=================+==============================+===============+
    | Card Type       | Begins With                  | Number Length |
    +=================+==============================+===============+
    | Fly Buys Black  | 60141                        | 16, 17        |
    +-----------------+------------------------------+---------------+
    | Fly Buys Red    | 6014352                      | 16            |
    +-----------------+------------------------------+---------------+
    | Fly Buys Green  | 6014355526 - 6014355529      + 16            |
    +-----------------+------------------------------+---------------+
    | Fly Buys Blue   | Every other card number      | 16            |
    |                 | starting with 6014           |               |
    +-----------------+------------------------------+---------------+

All of these card types also generate numbers such that they can be validated by an algorithm, so that's the second check systems usually try. The steps are:

1. Starting with the next to last digit and continuing with every second digit going back to the beginning of the card, double the digit
2. Sum all doubled and untouched digits in the number. For digits greater than 9 you will need to split them and sum them independently (i.e. <code>"10", 1 + 0</code>).
3. If that total is a multiple of 10, the number is valid.

For example, given the card number <code>6014355510000028</code>:

    1. 12 0 2 4 6 5 10 5 2 0 0 0 0 0 4 8
    2. 1+2+0+2+4+6+5+1+0+5+2+0+0+0+0+0+4+8 = 40
    3. 40 % 10 == 0

Thus that card is valid.

Let's try one more, <code>6014365510000028</code>:

    1. 12 0 2 4 6 6 10 5 2 0 0 0 0 0 4 8
    2. 1+2+0+2+4+6+6+1+0+5+2+0+0+0+0+0+4+8 = 40
    3. 41 % 10 == 1

This card is not valid.

## Task

Your task is to write a ruby program that accepts Fly Buys card numbers. Card numbers must be passed in line by line (one set of numbers per line). The program should print the card in the following format <code>"TYPE: NUMBERS (VALIDITY)"</code>.

## Input and Output

Given the following Fly Buys cards:

    60141016700078611
    6014152705006141
    6014111100033006
    6014709045001234
    6014352700000140
    6014355526000020
    6014 3555 2900 0028
    6013111111111111

I would expect the following output:

    Fly Buys Black: 60141016700078611 (valid)
    Fly Buys Black: 6014152705006141 (invalid)
    Fly Buys Black: 6014111100033006 (valid)
    Fly Buys Blue: 6014709045001234 (valid)
    Fly Buys Red: 6014352700000140 (valid)
    Fly Buys Green: 6014355526000020 (valid)
    Fly Buys Green: 6014355526000028 (invalid)
    Unknown: 6013111111111111 (invalid)
