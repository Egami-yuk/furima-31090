document.addEventListener('DOMContentLoaded', function() {
  const ImageList = document.getElementById('image-list1')
  const createImageHTML = (blob) => {
    const blobImage = document.createElement('img')
    blobImage.setAttribute('src', blob)
    blobImage.setAttribute('id', 'image1')
    // blobImage.setAttribute('class', image1)
    ImageList.prepend(blobImage)
  }
  document.getElementById('item-image1').addEventListener('change', (e) => {
    // const imageContent = document.querySelector('img');
    const imageContent = document.getElementById('image1');
    if (imageContent){
      imageContent.remove(); 
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    createImageHTML(blob)
  });
});
document.addEventListener('DOMContentLoaded', function() {
  const ImageList = document.getElementById('image-list2')
  const createImageHTML = (blob) => {
    const blobImage = document.createElement('img')
    blobImage.setAttribute('src', blob )
    blobImage.setAttribute('id', 'image2')
    ImageList.prepend(blobImage)
  }
  document.getElementById('item-image2').addEventListener('change', (e) => {
    // const imageContent = document.querySelector('img');
    const imageContent = document.getElementById('image2');
      if (imageContent){
        imageContent.remove();
      }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    createImageHTML(blob)
  });
});
