 use strict;
    use Algorithm::MarkovChain;
    use Path::Class;
    use autodie; 
	no warnings;
    my @inputs = qw(wildestdreams.txt 22.txt bothofus.txt badblood.txt eyesopen.txt blankspace.txt trouble.txt shake.txt oursongs.txt never.txt mean.txt lovestory.txt); 
    my $dir = dir("./libs");
    my $f = "";
	my $totalcounter = 0;
    my @symbols = ();
    foreach $f (@inputs) {
        my $file = $dir->file($f);
    	my $lcounter = 0;
        my $wcounter = 0;
        my $file_handle = $file->openr();
        while( my $line = $file_handle->getline() ) {
    		chomp ($line);
    		my @words = split(' ', $line);
            push(@symbols, @words);
    		$lcounter++;
    		$wcounter += scalar(@words);
			$totalcounter += $wcounter;
        }
    	print "$lcounter lines, $wcounter words read from $f\n";
    }   
	print "$totalcounter total words.\n";
    my $chain = Algorithm::MarkovChain::->new();
    $chain->seed(symbols => \@symbols, longest => 3);
    foreach (1 .. 14) {
        my @newness = $chain->spew(length   => 10,
                                   complete => [ qw(the ) ]);
        print join (" ", @newness), ".\n\n";
    }
