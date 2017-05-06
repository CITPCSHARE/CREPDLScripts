my @file    = glob "version1/*.crepdl";
for (my $i = 0; $i <= $#file; $i++){
    my $infilename = $file[$i];
    print $infilename, "\n";
    open (INFILE,  "< $infilename") or die("Error");
    my $outfilename = $infilename;
    $outfilename =~ s/version1/version2/g;
    print $outfilename, "\n";
    open (OUTFILE, ">> $outfilename") or die("Error");
    while (my $line = <INFILE>)  {
	$line =~ s/1.0/2.0\" mode=\"character/g;
	print OUTFILE $line;
    }
    close OUTFILE;
    close INFILE;
}
