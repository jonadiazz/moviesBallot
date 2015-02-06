#!/usr/bin/perl

use Modern::Perl;

print 'Welcome to the 87th Academy Awards!'."\n";

my @ctegories = (                   #2-dimensional array
  [  'Best Picture',
     'American Sniper',
     'Birdman or (The Unexpected Virtue of Ignorance)',
     'Boyhood',
     'The Grand Budapest Hotel',
     'The Imitation Game', 'Selma',
     'The Theory of Everything', 'Whiplash',  ],
  [  'Actor in a Leading Role',
     "Steve Carell, \"Foxcatcher\"",
     "Bradley Cooper, \"American Sniper\"",
     "Benedict Cumberbatch, \"The Imitation Game\"",
     "Michael Keaton, \"Birdman\"",
     "Eddie Redmayne, \"The Theory of Everything\"",  ],
  [  'Actress in a Leading Role',
     "Marion Cotillard, \"Two Days, One Night\"",
     "Felicity Jones, \"The Theory of Everything\"",
     "Julianne Moore, \"Still Alice\"",
     "Rosamund Pike, \"Gone Girl\"",
     "Reese Witherspoon, \"Wild\"",  ],
  [  'Animated Feature Film',
     'Big Hero 6',
     'The Boxtrolls',
     'How to Train Your Dragon 2',
     'Song of the Sea',
     'The Tale of Princess Kaguya',  ],
  [  "Makeup and Hairstyling",
     "Foxcatcher",
     "The Grand Budapest Hotel",
     "Guardians of the Galaxy",  ],
  [  "Original Song",
     '"Everything is Awesome" from "The Lego Movie"',
     '"Glory" from "Selma"',
     '"Grateful" from "Beyond the Lights"',
     '"I\'m Not Gonna Miss You" from "Glen Campbell ... I\'ll Be Me"',  ],
  [  'Writing Adapted Screenplay',
     'American Sniper',
     'The Imitation Game',
     'Inherent Vice',
     'The Theory of Everything',
     'Whiplash',  ],
  [  'Writing Original Screenplay',
     'Birdman or (The Unexpected Virtue of Ignorance)',
     'Boyhood',
     'Foxcatcher',
     'The Grand Budapest Hotel',
     'Nightcrawler',  ],
);

my $candidate, my $choice;
for $_ (@ctegories) {                  #loop the rows, $_ is default for @categories
   print (("="x40).("\nThe nominees for $$_[0] are: \n\n"));
   my $count = 1;
   for my $winner ( @$_[1..$#$_])   {  #loop the elements of each row
      print '['.$count.']'.' '.$winner, "\n";
      $count++;
   }
   print '['.$count.']'.' Write In'."\n";

   do {
      print "Please enter your choice for $$_[0] now: ";
      chomp ($choice = <>);
      if($choice == @$_) {             #$calar.@rray compare uses number of elements for @
         print 'Please enter your write-in candidate: ';
         chomp ($$_[$choice] = <>);    #enters new candidate into the 2-d array
      }
   } while ( $choice > $count || $choice < 1);
   chomp ($candidate .= $choice);
   print "Thanks for selecting ".@$_[$choice]." as ".$$_[0]."\n"x2;
}

print q!Thank you for voting. Here is a summary of your votes:!."\n"x2;

$candidate = reverse $candidate;
for $_(@ctegories) {
  print $$_[0].":\n\t".$$_[chop $candidate]."\n"x2;               #$$_[0] leading element
}                                                                 #$$_[chop $candidate] is the user's choice
