
subsetFilter=$1

USER_AT_HOST="csoeder@killdevil.unc.edu" 
SSHSOCKET=~/".ssh/$USER_AT_HOST"
ssh -M -f -N -o ControlPath="$SSHSOCKET" "$USER_AT_HOST"

for d00d in $( grep $subsetFilter d00ds.list ); do
	mkdir individuals/"$d00d" ;
	mkdir individuals/"$d00d"/mapt ;

	scp -o ControlPath="$SSHSOCKET" "$USER_AT_HOST":/netscr/csoeder/1kGen/individuals/"$d00d"/Trinity_files.Trinity.fasta* individuals/"$d00d"/ ;
	scp -o ControlPath="$SSHSOCKET" "$USER_AT_HOST":/netscr/csoeder/1kGen/individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy individuals/"$d00d"/ ;
	scp -o ControlPath="$SSHSOCKET" "$USER_AT_HOST":/netscr/csoeder/1kGen/individuals/"$d00d"/ILS_*.list individuals/"$d00d"/ ;
	scp -o ControlPath="$SSHSOCKET" "$USER_AT_HOST":/netscr/csoeder/1kGen/individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.lowCov_warning individuals/"$d00d"/ ;
	scp -o ControlPath="$SSHSOCKET" "$USER_AT_HOST":/netscr/csoeder/1kGen/individuals/"$d00d"/mapt/* individuals/"$d00d"/mapt/ ;
done ;

ssh -S "$SSHSOCKET" -O exit "$USER_AT_HOST"

#for d00d in $( grep $subsetFilter d00ds.list ); do
#	mkdir individuals/"$d00d" ;
#	mkdir individuals/"$d00d"/mapt ;
#	scp csoeder@killdevil.unc.edu:/netscr/csoeder/1kGen/individuals/"$d00d"/Trinity_files.Trinity.fasta* individuals/"$d00d"/ ;
#	scp csoeder@killdevil.unc.edu:/netscr/csoeder/1kGen/individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy individuals/"$d00d"/ ;
#	scp csoeder@killdevil.unc.edu:/netscr/csoeder/1kGen/individuals/"$d00d"/ILS_*.list individuals/"$d00d"/ ;
#	scp csoeder@killdevil.unc.edu:/netscr/csoeder/1kGen/individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.lowCov_warning individuals/"$d00d"/ ;
#	scp csoeder@killdevil.unc.edu:/netscr/csoeder/1kGen/individuals/"$d00d"/mapt/* individuals/"$d00d"/mapt/ ;
#done


