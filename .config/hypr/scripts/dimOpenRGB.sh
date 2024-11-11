#!/bin/bash

COLOR=$(wal-accent)

darker=$(pastel darken 0.5 $COLOR | pastel format hex)
darker=${darker#"#"} # remove the leading '#'


openrgb -c $darker