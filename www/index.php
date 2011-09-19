
<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<?php

$domain=ereg_replace('[^\.]*\.(.*)$','\1',$_SERVER['HTTP_HOST']);
$group_name=ereg_replace('([^\.]*)\..*$','\1',$_SERVER['HTTP_HOST']);
$themeroot='http://r-forge.r-project.org/themes/rforge/';

echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en   ">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><?php echo $group_name; ?></title>
	<link href="<?php echo $themeroot; ?>styles/estilo1.css" rel="stylesheet" type="text/css" />
  </head>

<body>

<!-- R-Forge Logo -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="/"><img src="<?php echo $themeroot; ?>/images/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>


<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->

<?php if ($handle=fopen('http://'.$domain.'/export/projtitl.php?group_name='.$group_name,'r')){
$contents = '';
while (!feof($handle)) {
	$contents .= fread($handle, 8192);
}
fclose($handle);
echo $contents; } ?>

<!-- end of project description -->

<h3>Description</h3>

<p>Phenology and seasonal succession in aquatic, and of course also
terrestrial, ecosystems are strongly dependent on physical factors. In
order to promote investigations into this coupling, objective and
reliable methods of characterising annual time series are important.
The cardidates package provides methods for fitting "peaks" of
environmental data and approaches for an "objective" characterisation
of what we call "cardinal dates", i.e. beginning, time of maximum and
time of end of an identified peak. Objectivity means that it is not
necessarily important to get good estimates for one particular time
series but to get reproducible results independently of the person who
performs the analysis.</p>

<p>The proposed methods were developed within the <a
href="http://www.ifm-geomar.de/?id=1985&L=1">AQUASHIFT</a> research
program and used to determine the beginning, maximum and end of the
spring mass development of phytoplankton in different lakes and water
reservoirs. These time points, that we call "cardinal dates", can be
analysed for temporal trends and relationships to climate variables.
The complete methodology is described in Rolinski, Horn, Petzoldt, and
Paul (2007). Until now we implemented only the most reliable approach
using Weibull-functions (Method B in the article); other functions may
follow.</p>

<p>This method consists of fitting four- resp. six parametric Weibull
functions to environmental time series. Heuristics are applied for
finding initial parameters in the six parametric case. As a second
step, the fitted functions can be used to identify maximum, beginning
and end of peaks by using a quantile-like approach.</p>

<p>Examples about the intention and use of the package can be found in the
<a href="http://r-forge.r-project.org/plugins/scmsvn/viewcvs.php/*checkout*/pkg/cardidates/inst/doc/vignette.pdf?root=cardidates">
  Quickstart Manual</a>.

<p>The methodology may also be useful for other ecological time series
(e.g. bacteria, protozoa, insects or small mammals). Please don't
hesitate to contact the authors if you feel that this package should
be generalized to other processes.</p>

<h3>References</h3>

  Rolinski, S., Horn, H., Petzoldt, T., & Paul, L. (2007):
  Identification of cardinal dates in phytoplankton time series to
  enable the analysis of long-term trends. Oecologia
  <strong>153</strong>, 997 - 1008.

<h3>Sourcecode and Downloads</h3>

<p> You can download compiled packages for different operation systems
(Linux, Mac, Windows) or inspect source code and documentation online
before downloading.</p>

<p>Details can be found on the <a href="http://<?php echo $domain;
?>/projects/<?php echo $group_name; ?>/"><strong>project summary
page</strong></a>. </p>

</body>
</html>
