use strict;
use warnings;

# Open the output file in append mode
open(my $output_file, '>>', 'output.log') or die "Cannot open output file: $!";

# Open the input file
open(my $input_file, '<', '../art/ansi_bruce.txt') or die "Cannot open input file: $!";

# Get the current timestamp
my $timestamp = localtime;

# Append the timestamp to the output file
print $output_file "\n", $timestamp, " [PERL] ";
print $timestamp, " [PERL] ";

# Read characters from the input file
my @characters;
while (my $line = <$input_file>) {
    chomp $line;
    push @characters, split('', $line);
}

# Shuffle the array of characters
@characters = shuffle_array(@characters);

# Select random 25 characters
my $random_length = 25;
my @random_characters = @characters[0..$random_length-1];

# Print the random characters to the output file
print $output_file join('', @random_characters), " ";
# and to the putput
print join('', @random_characters), "\n";

# Close the files
close $output_file;
close $input_file;

# Subroutine to shuffle an array (Fisher-Yates algorithm)
sub shuffle_array {
    my @array = @_;
    my $count = scalar(@array);

    for (my $i = $count - 1; $i > 0; $i--) {
        my $j = int(rand($i + 1));
        ($array[$i], $array[$j]) = ($array[$j], $array[$i]);
    }

    return @array;
}
