#!/bin/sh


pswd=tha_snazzle
usr=csoeder
db_name=murple

#echo "select precand_pk, chrom, start, stop, strand from candidate where charlie_thumbs ='up';" | mysql --user=$usr --password=$pswd $db_name -N
#read chrom start stop <<<$(echo "select chrom, start, stop from candidate where precand_pk =$db_id;" | mysql --user=$usr --password=$pswd $db_name -N )


#echo "select precand_pk, chrom, start, stop, strand from candidate where charlie_thumbs ='up' limit 10;" | mysql --user=$usr --password=$pswd $db_name -N | while read line; do peekay=$(echo $line | tr ' ' '\t' | cut -f 1 ); chrom=$(echo $line | tr ' ' '\t' | cut -f 2 ); start=$(echo $line | tr ' ' '\t' | cut -f 3 ); stop=$(echo $line | tr ' ' '\t' | cut -f 4 ); strand=$(echo $line | tr ' ' '\t' | cut -f 5 ); start_z0=$start; start_z1=$((start-(stop-start))); start_z2=$((start-5*(stop-start))); stop_z0=$stop; stop_z1=$((stop+(stop-start))); stop_z2=$((stop+5*(stop-start))); echo $chrom:$start_z0-$stop_z0, $chrom:$start_z1-$stop_z1, $chrom:$start_z2-$stop_z2 ; done

echo "select precand_pk, chrom, start, stop, strand from candidate where v4_triage_thumbs ='up';" | mysql --user=$usr --password=$pswd $db_name -N  | while read line; do 

	peekay=$(echo $line | tr ' ' '\t' | cut -f 1 );
	chrom=$(echo $line | tr ' ' '\t' | cut -f 2 );
	start=$(echo $line | tr ' ' '\t' | cut -f 3 );
	stop=$(echo $line | tr ' ' '\t' | cut -f 4 );
	strand=$(echo $line | tr ' ' '\t' | cut -f 5 );
	read xpressr1 xpressr2 xpressr3 <<<$(echo "select distinct l.person_name from precandidate_lookup l, person p where l.precand_id=$peekay and p.phase3orphan=0 order by rand() limit 3;" | mysql --user=$usr --password=$pswd $db_name -N)
	read nonxpressr1 nonxpressr2 nonxpressr3 <<<$(echo "select person_name from person where rna_seq=1 and phase3orphan=0 and person_name not in ( select person_name from precandidate_lookup where precand_id =$peekay ) order by rand() limit 3;" | mysql --user=$usr --password=$pswd $db_name -N)
	start_z0=$start
	start_z1=$((start-(stop-start)))
	start_z2=$((start-5*(stop-start)))
	stop_z0=$stop
	stop_z1=$((stop+(stop-start)))
	stop_z2=$((stop+5*(stop-start)))


	sh igv_data_prepper.sh $chrom $start_z2 $stop_z2 $strand Expressers_"$peekay" $xpressr1 $xpressr2 $xpressr3 
	sh igv_data_prepper.sh $chrom $start_z2 $stop_z2 $strand NonExpressers_"$peekay" $nonxpressr1 $nonxpressr2 $nonxpressr3 

	sh igv_xml_writer.sh $peekay "$peekay"_zoomIn $nonxpressr1 $nonxpressr2 $nonxpressr3 $xpressr1 $xpressr2 $xpressr3 > "$peekay"_zoomIn.xml
	sh igv_xml_writer.sh $peekay "$peekay"_zoomMed $nonxpressr1 $nonxpressr2 $nonxpressr3 $xpressr1 $xpressr2 $xpressr3 > "$peekay"_zoomMed.xml
	sh igv_xml_writer.sh $peekay "$peekay"_zoomOut $nonxpressr1 $nonxpressr2 $nonxpressr3 $xpressr1 $xpressr2 $xpressr3 > "$peekay"_zoomOut.xml


#	sh igv_xml_writer_dev.sh $peekay "$peekay"_zoomIn $nonxpressr1 $nonxpressr2 $nonxpressr3 $xpressr1 $xpressr2 $xpressr3 > "$peekay"_zoomIn.xml
#	sh igv_xml_writer_dev.sh $peekay "$peekay"_zoomMed $nonxpressr1 $nonxpressr2 $nonxpressr3 $xpressr1 $xpressr2 $xpressr3 > "$peekay"_zoomMed.xml
#	sh igv_xml_writer_dev.sh $peekay "$peekay"_zoomOut $nonxpressr1 $nonxpressr2 $nonxpressr3 $xpressr1 $xpressr2 $xpressr3 > "$peekay"_zoomOut.xml

	sh igv_script_commander.sh $chrom $start_z0 $stop_z0 "$peekay"_zoomIn igvcommands
	sh igv_script_commander.sh $chrom $start_z1 $stop_z1 "$peekay"_zoomMed igvcommands
	sh igv_script_commander.sh $chrom $start_z2 $stop_z2 "$peekay"_zoomOut igvcommands

done

