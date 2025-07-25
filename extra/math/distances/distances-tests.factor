! Copyright (C) 2012 John Benediktsson
! See https://factorcode.org/license.txt for BSD license

USING: kernel literals math.distances math.functions tools.test
;

{ 1 } [ "hello" "jello" hamming-distance ] unit-test

${ 3 sqrt } [ { 1 1 1 } { 2 2 2 } euclidian-distance ] unit-test
{ 14 } [ { 1 2 3 } { 2 4 6 } squared-euclidian-distance ] unit-test
{ 1/4 } [ { 1 2 3 } { 3 5 10 } normalized-squared-euclidian-distance ] unit-test

{ 0.0 } [ { 1 2 3 } dup cosine-distance ] unit-test
{ t } [ { 1 2 3 } { 4 5 6 } cosine-distance 0.02536815380292379 1e-10 ~ ] unit-test
{ t } [ { 1 2 3 } { 1 -2 3 } cosine-distance 0.5714285714285714 1e-10 ~ ] unit-test

{ 143/105 } [ { 1 2 3 } { 4 5 6 } canberra-distance ] unit-test

{ 3/7 } [ { 1 2 3 } { 4 5 6 } bray-curtis-distance ] unit-test

{ t } [ { 1 2 3 } dup correlation-distance 0.0 1e-10 ~ ] unit-test
{ t } [ { 1 2 3 } { 1 2 1 } correlation-distance 1.0 1e-10 ~ ] unit-test
{ t } [ { 1 2 3 } { 3 2 1 } correlation-distance 2.0 1e-10 ~ ] unit-test

{ 0.09166666666666667 } [ "seperate" "separate" jaro-winkler-distance ] unit-test
{ 0.04222222222222227 } [ "goverment" "government" jaro-winkler-distance ] unit-test
{ 0.08153846153846156 } [ "accomodate" "accommodation" jaro-winkler-distance ] unit-test
