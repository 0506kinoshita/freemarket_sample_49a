crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end


crumb :item do 
  @item = Item.find(params[:id])
  link "#{@item.name}", item_path
  parent :root
end

crumb :show_item do
  link "出品した商品-出品中", user_path(current_user.id)
  parent :mypage
end

crumb :profile do
  link "プロフィール", user_path(current_user.id)
  parent :mypage
end

crumb :logout do
  link "ログアウト", user_path(current_user.id)
  parent :mypage
end

# show_profileページ
crumb :userpage do
  link current_user.nickname, user_path(current_user.id)
  parent :root
end


