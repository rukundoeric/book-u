module UsersHelper
  def cover_image(user)
    if user.cover.exists?
      image_tag current_user.cover.url, id: 'cover-image-d', class: 'cover_image ml-0 ml-3'
    else
      image_tag 'https://tokystorage.s3.amazonaws.com/images/default-cover.png', id: 'cover-image-d', class: 'cover_image ml-3'
    end
  end
end
