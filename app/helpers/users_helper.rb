module UsersHelper
  def user_icon(user, size: 120)
    if user.image.present?
      image_tag(user.image.url, alt: user.user_name, id: :img_prev, class: 'user-icon', size: size)
    else
      image_tag("user_default_icon.jpg", id: :img_prev, class: 'user-icon', size: size)
    end
  end
end
