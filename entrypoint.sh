#!/bin/sh
set -eu

# Some platforms mutate apache module state at runtime; enforce the desired MPM.
a2dismod mpm_event mpm_worker >/dev/null 2>&1 || true
a2enmod mpm_prefork >/dev/null 2>&1 || true

# Start Apache as PID 1
exec apache2-foreground
