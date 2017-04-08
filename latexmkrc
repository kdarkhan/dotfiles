my $osname = $^O;
$pdf_mode = 1;
$pdflatex="xelatex %O %S";
$out_dir="auxdir";

if ( $osname eq 'darwin' ) {
    $pdf_previewer = 'start open -a Skim';
} else {
    $pdf_previewer = 'start evince';
}
