# How to run

Dependencies: 1Password, Cisco Secure Client

The script connect.sh needs to contain your password and OTP
If you use 1Password, these can be safely injected by running the script
like this: `op run -- ./connect.sh`
https://developer.1password.com/docs/cli/reference/commands/run/


```bash
# copy environment file and change to your details
cp .env.default .env

# run
op run --env-file .env -- connect.sh
```
