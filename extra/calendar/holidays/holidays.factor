! Copyright (C) 2009 Doug Coleman.
! See https://factorcode.org/license.txt for BSD license.
USING: accessors assocs calendar hashtables kernel
parser sequences vocabs words ;
IN: calendar.holidays

SINGLETON: all

SYNTAX: HOLIDAY:
    scan-new-word
    parse-definition ( timestamp/n -- timestamp ) define-declared ;

SYNTAX: HOLIDAY-NAME:
    scan-word "holiday" scan-word scan-object swap
    '[ _ _ rot ?set-at ] change-word-prop ;

GENERIC: holidays ( timestamp/n singleton -- seq )

<PRIVATE

: (holidays) ( singleton -- seq )
    all-words [ "holiday" word-prop key? ] with filter ;

M: object holidays
    (holidays) [ [ clone ] dip execute( timestamp -- timestamp ) ] with map ;

PRIVATE>

M: all holidays drop (holidays) ;

: holiday? ( timestamp/n singleton -- ? )
    [ holidays ] [ drop ] 2bi '[ _ same-day? ] any? ;

: holiday-assoc ( timestamp singleton -- assoc )
    (holidays) swap '[
        [ _ clone swap execute( timestamp -- timestamp ) ] keep
    ] map>alist ;

: holiday-name ( singleton word -- string/f )
    "holiday" word-prop at ;

: holiday-names ( timestamp/n singleton -- seq )
    [
        [ clone ] dip
        [ drop ] [ holiday-assoc ] 2bi swap
        '[ _ same-day? ] filter-keys values
    ] keep '[ _ swap "holiday" word-prop at ] map ;
