uploadcare.openDialog(null, {
  crop: "disabled",
  previewStep: true,
  imagesOnly: true
  }).done(function(file) {
  file.promise().done(function(fileInfo){
    console.log(fileInfo.cdnUrl);
  });
});
