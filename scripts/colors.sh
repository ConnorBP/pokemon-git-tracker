# Colors
RESET='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'

# Function to print colored text
print_colored() {
    local color="$1"
    local message="$2"

    if [[ -n ${!color} ]]; then
        printf "${!color}%b${RESET}" "$message"
    else
        echo "Invalid color: $color"
    fi
}
