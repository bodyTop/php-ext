--TEST--
imagecreatefromtga() - basic functionality
--SKIPIF--
<?php
if (!extension_loaded('gd')) die('skip ext/gd required');
if (!(imagetypes() & IMG_TGA)) die('skip TGA support required');
?>
--FILE--
<?php
// create an image from a TGA file
$im = imagecreatefromtga(__DIR__ . '/imagecreatefromtga_basic.tga');

include_once __DIR__ . '/func.inc';
test_image_equals_file(__DIR__ . '/imagecreatefromtga.png', $im);
?>
--EXPECT--
The images are equal.
