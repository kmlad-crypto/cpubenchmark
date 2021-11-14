```bash

!/bin/sh
CORES=$(grep -c processor /proc/cpuinfo)

echo "======= STARTING CPU BENCHMARK =======" echo "CPU: $CORES x $(grep -m 1 'model name' /proc/cpuinfo | cut -d ':' -f 2)"

echo "Singlecore speed test" singlecorespeed=$(openssl speed -elapsed -evp aes-128-cbc 2> /dev/null | tail -1 | awk '{ printf $2; }' | cut -d '.' -f 1) echo "Singlecore speed: $singlecorespeed" echo ""

echo "Testing multicore speed with $CORES cores" multicorespeed=$(openssl speed -elapsed -multi $CORES -evp aes-128-cbc 2> /dev/null | tail -1 | awk '{ printf $2; }' | cut -d '.' -f 1) echo "Multicore speed: $multicorespeed" ```
