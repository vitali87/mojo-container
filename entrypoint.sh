#!/bin/bash

# Ensure the necessary directory exists and create a symlink if needed
if [ -f "/usr/lib/x86_64-linux-gnu/libstdc++.so.6" ] && [ -d "/app/hello-world/.magic/envs/default/lib" ]; then
    ln -sf /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /app/hello-world/.magic/envs/default/lib/libstdc++.so.6
fi

# Start an interactive bash session
exec /bin/bash

