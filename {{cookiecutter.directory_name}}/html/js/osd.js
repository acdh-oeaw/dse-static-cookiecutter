// change css styles to remove html images and set height for script repacement
$('#non-OSD-images').css({
    'display': 'none'
});
$('#OSD-images').css({
    'height': '400px'
});
// OpenSeaDragon Image Viewer
var tileSources =[];
document.body.querySelectorAll('.tei-xml-images').forEach(function (node) {
    var imageURL = node.getAttribute('src');
    tileSources.push({
        type: 'image', url: imageURL
    });
});
var viewer = OpenSeadragon({
    id: 'OSD-images',
    prefixUrl: 'https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.1/images/',
    sequenceMode: true,
    showReferenceStrip: true,
    showNavigator: true,
    imageLoaderLimit: 10,
    tileSources: tileSources
});
$('#non-OSD-images').remove();