function load_image(facs_id, osd_container_id, osd_container_id2){
    $('#' + osd_container_id).css({
        'height': '400px'
    });
    // OpenSeaDragon Image Viewer
    var image = $('#' + facs_id);
    var image = image.attr('src');
    var imageURL = {type: 'image', url: image};
    var viewer = OpenSeadragon({
        id: osd_container_id,
        prefixUrl: 'https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.1/images/',
        // sequenceMode: true,
        // showReferenceStrip: true,
        // showNavigator: true,
        // imageLoaderLimit: 10,
        tileSources: imageURL
    });
    $('#' + osd_container_id2).remove();
};