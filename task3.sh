gawk -F',' 'BEGIN {OFS=","} $3 == 2 && $NF ~ /S/ {print $0}' titanic.csv | sed 's/female/F/g; s/male/M/g' |  gawk -F',' 'BEGIN {OFS=","} {print $0} {if($7 != "") {sum += $7; count++}} END {if(count > 0) print "Average Age:" sum/count}'