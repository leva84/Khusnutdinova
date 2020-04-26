module UsersHelper
  # Если у пользователя есть собственный аватар, то показываем его,
  # иначе — стандартную иконку.
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('orig.jpeg')
    end
  end
end
