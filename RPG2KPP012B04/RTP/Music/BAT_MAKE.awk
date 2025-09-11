BEGIN {
	bef_ext = "";
} {
	for( str_cnt = length( $0 ); str_cnt > 0; str_cnt-- ){
		str_atom = substr( $0, str_cnt, 1 );
		if( str_atom == "." ){
			file_ext = substr( $0, str_cnt, (length( $0 ) - str_cnt + 1) );
			if( (bef_ext == ".mid" || bef_ext == ".MID") &&
				(file_ext == ".mid" || file_ext == ".MID") ){
				printf( "rename Timidi95.wav %swav\n", bef_file );
				exit;
			}
			bef_ext = file_ext;
			bef_file = substr( $0, 1, str_cnt );
			next;
		}
	}
} END {
	if( (bef_ext == ".mid" || bef_ext == ".MID") ){
		printf( "rename Timidi95.wav %swav\n", bef_file );
	}
}
