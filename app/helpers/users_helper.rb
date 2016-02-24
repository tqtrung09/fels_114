module UsersHelper

  def gravatar_for user
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def avatar user
    user.avatar? ? image_tag(user.avatar.url) : gravatar_for(user)
  end
end
