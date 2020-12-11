var cover_image = document.getElementById("cover-image-d");
var set_cover_image = document.getElementById("set-cover-image");
var change_cover_image = document.getElementById("change-cover-image");

$("body").on("change", "#user_cover", function (e) {
  var files = e.target.files;
  var done = function (url) {
    cover_image.src = url;
    set_cover_image.classList.remove("d-none");
    set_cover_image.classList.add("d-block");
    change_cover_image.classList.remove("d-block");
    change_cover_image.classList.add("d-none");
  };
  var reader;
  var file;

  if (files && files.length > 0) {
    file = files[0];

    if (URL) {
      done(URL.createObjectURL(file));
    } else if (FileReader) {
      reader = new FileReader();
      reader.onload = function (e) {
        done(reader.result);
      };
      reader.readAsDataURL(file);
    }
  }
});
