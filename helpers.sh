output() {
    echo "##############################################"
    echo $1
    echo "##############################################"
}

small_output() {
    echo "##############################################"
    echo $1
}


parse_env() {
    SETTING=$(grep $1 .env | cut -d '=' -f2)
    echo $SETTING
}

export -f output
export -f small_output
export -f parse_env
