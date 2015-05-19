#!/bin/bash
set -e

source $TOOLS_DIR/functions.sh

# Create the user's mail account. This will ask for a password if none was given above.
$TOOLS_DIR/mail.py user add $EMAIL_ADDR $EMAIL_PW

# Make it an admin.
hide_output $TOOLS_DIR/mail.py user make-admin $EMAIL_ADDR

# Create an alias to which we'll direct all automatically-created administrative aliases.
$TOOLS_DIR/mail.py alias add administrator@$PRIMARY_HOSTNAME $EMAIL_ADDR
