#!/bin/bash

cd lambdas/repodex/;
cargo lambda build -r --arm64 -o zip;
