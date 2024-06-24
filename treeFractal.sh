clear

declare -A matrix

# Fill it up with underscores first
for ((i = 0; i < 63; i++)); do
    for ((j = 0; j < 101; j++)); do
        matrix[$i,$j]="_"
    done
done

# Draw the vertical branch
draw_trunk() {
    local row_start=$1
    local row_end=$2

    for ((row = row_start; row < row_end; row++))
    do
        for col in "${st_points[@]}"
        do
            matrix[$row,$col]="|"
        done
    done
}

# Build the inclined branches
draw_branches() {
    local row_start=$1
    local row_end=$2
    local inbtw=1    
    local loc_st_points=("${st_points[@]}")
    st_points=()
    for ((row = row_end-1; row > row_start; row--))
    do
    	for col in "${loc_st_points[@]}"
    	do

    		right=$((col-inbtw))
    		left=$((col+inbtw))
    		
    		matrix[$row,$right]="\\"
    		matrix[$row,$left]="/"
    		if (($row == $row_start+1))
    		then
    			st_points+=("$right")
    			st_points+=("$left")
    		fi
    	done
    	inbtw=$((inbtw+1))
    done

}

read N

row_end=0
row_start=62
lev_length_prec=0
st_points=(50)
for ((lev = 1; lev <= N; lev++))
do
	lev_length=$((2**(5-lev+1)))
    row_end=$row_start+1
	row_start=$((row_end - lev_length/2))
	
	draw_trunk "$row_start" "$row_end"
	
	row_end=$row_start
	row_start=$((row_end-lev_length/2-1))

	draw_branches "$row_start" "$row_end"
	
	lev_length_prec=$lev_length
done

# Print the matrix
for ((i = 0; i < 64; i++)); do
    for ((j = 0; j < 101; j++)); do
        printf "%s" "${matrix[$i,$j]}"
    done
    printf "\n"
done


