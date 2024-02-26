#!/usr/bin/env bash
# The environment variables need contain your password and OTP
# If you use 1Password, this can be achieved by running this script
# like this: `op run -- ./connect.sh`
# https://developer.1password.com/docs/cli/reference/commands/run/

# Check if expect is available
if ! command -v expect &> /dev/null; then
    echo "expect is not installed. Please install it first."
    exit 1
fi

# Execute the VPN connection with expect
expect <<EOF
    set timeout 300

    # Start the VPN command
    spawn /opt/cisco/secureclient/bin/vpn -s connect $VPN_HOST

    # Wait for the group prompt and send the default choice (Enter)
    expect "Group: "
    send "\r"

    # Wait for the username prompt and send the default choice (Enter)
    expect "Username: "
    send "\r"

    # Wait for the password prompt
    expect "Password: "

    # Send the password
    send -- "$JUMPCLOUD_PASSWORD,$JUMPCLOUD_OTP\r"

    # Allow the process to complete
    expect "state: Connected"
    expect eof
EOF

echo "VPN connection attempt complete."

