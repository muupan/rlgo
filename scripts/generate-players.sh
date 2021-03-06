#!/bin/bash

#----------------------------------------------------------------------------#
# Generate a set of programs from a set of weight files
if [ $# -lt 5 ]
then
    echo "Usage:"
    echo "generate-players.sh player path"
    echo ""
    echo "player:   Base player to run weights with"
    echo "path:     Path where weight files are saved"
    echo "setting:  Setting to vary"
    echo "values:   Values of setting used"
    echo "numgnugo: Number of gnugo players to include"
    echo "options:  Any set of options supported by RLGO"
    exit 1
fi

SCRIPTDIR=`dirname $0`
PLAYER=$1
PATHSTEM=$2
SETTING=$3
VALUES=$4
NUMGNUGO=$5
shift; shift; shift; shift; shift
OPTIONS=$@

PREFIX=MainLogWeightsN
SUFFIX=w

GNUGO=`$SCRIPTDIR/getprogram.sh gnugod`
for ((i=1; i<=NUMGNUGO; ++i))
do
    echo "GnuGoD" > $PATHSTEM/short-names.txt
    echo $GNUGO > $PATHSTEM/program-names.txt
done

COUNT=1
for VALUE in $VALUES
do
    OVERRIDE="-$SETTING $VALUE"
    if echo $VALUE | grep -q '[^a-zA-Z0-9_./\-]'
    then
        PATHSUB=$COUNT
    else
        PATHSUB=$VALUE
    fi
    NEWPATH=$PATHSTEM/match-$PATHSUB
    ABSPATH=`cd $NEWPATH; pwd`

    for WEIGHTFILE in $NEWPATH/$PREFIX*.$SUFFIX
    do
        SHORTWEIGHT=${WEIGHTFILE##$NEWPATH/$PREFIX}
        WFILE=`basename $WEIGHTFILE`
        N=${SHORTWEIGHT%%.$SUFFIX}
        mkdir -p $NEWPATH/player-$N
        NAME="$PLAYER""_$PATHSUB:$N"
        PROGRAM=`$SCRIPTDIR/getprogram.sh $PLAYER -WeightFile $ABSPATH/$WFILE -OutputPath $NEWPATH/player-$N $OVERRIDE $OPTIONS`
        echo "$NAME" >> $PATHSTEM/short-names.txt
        echo "$PROGRAM" >> $PATHSTEM/program-names.txt
    done

    COUNT=$((COUNT+1))
done
