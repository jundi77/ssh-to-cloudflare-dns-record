# SSH Automatically With Public IP From Cloudflare DNS Record

I created this script to help me always ssh to my public ip from my cloudflare DNS Record. To use, make `.env` file from `.env.example` and fill the variables, then run `ssh.sh`.
Please install programs that listed in `requirements` file beforehand.

`.env.example` variable explanation:

- CLOUDFLARE_TOKEN_DNS = Your cloudflare API Token (not to be misunderstood with cloudlare's API Keys)
- CLOUDFLARE_ZONE_ID = Your DNS zone ID (Open your website in cloudflare, go to overview, your Zone ID should be there)
- CLOUDFLARE_DNS_RECORD_ID = Your DNS Record ID (You can find out your DNS Record ID with `see-dns-record.sh` script)


`ssh.sh` usage:
```bash
./ssh.sh (user) (port)
```