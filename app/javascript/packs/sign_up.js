var image = document.getElementById("profile-image");
var default_avatar = document.getElementById("default");

$("body").on("change", "#user_photo", function (e) {
  var files = e.target.files;
  var done = function (url) {
    image.src = url;
    image.classList.remove("d-none");
    image.classList.add("d-block");
    default_avatar.classList.remove("d-block");
    default_avatar.classList.add("d-none");
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